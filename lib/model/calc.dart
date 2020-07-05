import 'package:scicalc/calc_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/background.dart';
import 'package:petitparser/petitparser.dart';
import 'dart:math' as math;

final result = StateProvider((ref)=>'');
final inputExpression = StateProvider((ref) => '0');
var tempResult = '';
var tempExpression = '';
var parser;


void evaluate(context, exp, operand){

  tempResult = result.read(context).state;
  
  print('operand $operand');
  // print(tempResult);
  
  parser = buildExpression().build();
  
  tempExpression = inputExpression.read(context).state;
  
  switch(operand){
    case kClearSign: _clear();
    break;
    case kDelSign: _deleteValue();
    break;
    case kEqualSign: 
    // keyboardType.read(context).state ? _calculateScientificCalculator() : 
    _calculateSimpleResult();
    break;
    case '+/-': _negateResult();
  }
  
  result.read(context).state = tempResult;
  inputExpression.read(context).state = tempExpression;
}

void _clear(){
  tempResult = '';
  tempExpression = '0';
}

void _negateResult(){
  tempResult = tempResult == '' ? (-1*int.parse(tempExpression)).toString() : (-1*int.parse(tempResult)).toString();
}

void _deleteValue(){
  tempExpression = tempExpression.substring(0, tempExpression.length - 1);
  if (tempExpression == '') tempExpression = '0';
}

void _calculateSimpleResult(){
  _tryComputeResult();
}

// void _calculateScientificCalculator(){
//   print('1');
//   tempExpression = tempExpression.replaceAll('×', '*');
//   tempExpression = tempExpression.replaceAll('÷', '/');
//   tempExpression = tempExpression.replaceAll(kPiSign, '3.1415926535897932');
//   tempExpression = tempExpression.replaceAll(kESign, 'e^1');
//   tempExpression = tempExpression.replaceAll(kSquareRootSign, 'sqrt');
//   tempExpression = tempExpression.replaceAll(kPowerSign, '^');
//   tempExpression = tempExpression.replaceAll(kArcSineSign, 'arcsin');
//   tempExpression = tempExpression.replaceAll(kArcCosSign, 'arccos');
//   tempExpression = tempExpression.replaceAll(kArcTanSign, 'arctan');
//   tempExpression = tempExpression.replaceAll(kLogSign, 'log');
//   print(tempExpression);
//   _tryComputeResult();
// }

void _tryComputeResult(){
  // print(tempExpression);
  try {
    var temp = parser.parse(tempExpression).toString().split(' ');
    tempResult = temp.last;
    if (tempResult == 'NaN') tempResult = 'Error';
    if (tempResult.toString().endsWith(".0")) {
      tempResult = int.parse(tempResult.toString().replaceAll(".0", "")).toString();
    }
    // print(tempResult);
  } catch (e) {
    print(e);
  }
}

buildExpression(){
  final builder = ExpressionBuilder();
  builder.group()
  ..primitive(digit()
      .plus()
      .seq(char('.').seq(digit().plus()).optional())
      .flatten()
      .trim()
      .map((a) => num.tryParse(a)))
  ..wrapper(char('(').trim(), char(')').trim(), (l, a, r) => a);

  builder.group()..prefix(char('~').trim(), (op, a) => -a);
  builder.group()..right(char('^').trim(), (a, op, b) => math.pow(a, b));
  builder.group()
    ..left(char('×').trim(), (a, op, b) => a * b)
    ..left(char('÷').trim(), (a, op, b) => a / b)
    ..left(char('%').trim(), (a, op, b) => a % b);
  builder.group()
  ..left(char('+').trim(), (a, op, b) => a + b)
  ..left(char('-').trim(), (a, op, b) => a - b);
  // builder.group()
  // ..left(char('<<').trim(), (a, op, b) => a << b)
  // ..left(char('>>').trim(), (a, op, b) => a >> b);
  // builder.group()
  // ..left(char('&&').trim(), (a, op, b) => a && b)
  // ..left(char('||').trim(), (a, op, b) => a || b);
  builder.group()
  ..left(char('.').trim(), (a, op, b) => '$a.$b');
  return builder;
}