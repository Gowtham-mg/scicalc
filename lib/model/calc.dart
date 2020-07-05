import 'package:scicalc/calc_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';


final result = StateProvider((ref)=>'');
final inputExpression = StateProvider((ref) => '0');
var tempResult = '';
var tempExpression = '';
void evaluate(context, exp, operand){
  tempResult = result.read(context).state;
  print(tempResult);
  tempExpression = inputExpression.read(context).state;
  switch(operand){
    case kClearSign: _clear();
    break;
    case kDelSign: _deleteValue();
    break;
    case kEqualSign: _calculateResult();
  }
  result.read(context).state = tempResult;
  inputExpression.read(context).state = tempExpression;
}

void _clear(){
  tempResult = '';
  tempExpression = '0';
}

void _deleteValue(){
  tempExpression = tempExpression.substring(0, tempExpression.length - 1);
  if (tempExpression == '') tempExpression = '0';
}

void _calculateResult(){
  tempExpression = tempExpression.replaceAll('×', '*');
  tempExpression = tempExpression.replaceAll('÷', '/');
  try {
    Parser p = Parser();
    Expression exp = p.parse(tempExpression);
    ContextModel cm = ContextModel();
    tempResult = '${exp.evaluate(EvaluationType.REAL, cm)}';
    if (tempResult == 'NaN') tempResult = 'Error';
    if (tempResult.toString().endsWith(".0")) {
      tempResult = int.parse(tempResult.toString().replaceAll(".0", "")).toString();
    }
  } catch (e) {
  }
}