import 'package:scicalc/calc_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/modes_of_calc.dart';
import 'package:petitparser/petitparser.dart';
import 'dart:math' as math;
import 'package:function_tree/function_tree.dart';

String result = '';
final inputExpression = StateProvider((ref) => '');
var tempExpression = '';
var parser;


void evaluate(context, exp, operand){

  print('operand $operand');

  tempExpression = exp;
  switch(operand){
    case kClearAllSign: _clear();
    break;
    case kDelSign: _deleteValue();
    break;
    case kEqualSign: keyboardType.read(context).state ? _calculateScientificCalculator() : 
    _calculateSimpleResult();
    break;
    case '+/-': _negateResult();
  }
  
  inputExpression.read(context).state = operand == kEqualSign || operand == '+/-' ? result : tempExpression;
}

void _clear(){
  result = '';
  tempExpression = '';
}

void _negateResult(){
  print('ngateResult');
  result = result.isEmpty ? (-1*(int.parse(tempExpression))).toString() : (-1*(int.parse(result))).toString();
}

void _deleteValue(){
  tempExpression = tempExpression.substring(0, tempExpression.length - 1);
  if (tempExpression == '') tempExpression = '0';
}

void _calculateSimpleResult(){
  tempExpression = tempExpression.replaceAll(kDivisionSign, '/');
  tempExpression = tempExpression.replaceAll(kMultiplicationSign, '*');
  parser = buildExpression().build();
  _tryComputeResult();
}

void _calculateScientificCalculator(){
  print('1');
  parser = buildExpressionComplex().build();
  print('tempExpression $tempExpression');
  tempExpression = tempExpression.replaceAll(kPiSign, 'pi');
  tempExpression = tempExpression.replaceAll(kMultiplicationSign, '*');
  tempExpression = tempExpression.replaceAll(kDivisionSign, '/');

  _tryComputeResult();
}

void _tryComputeResult(){
  try {
    var temp = parser.parse(tempExpression).toString().split(' ');
    print('hello');
    result = temp.last;
    result = tempExpression.interpret().toString();
    print('$result result');
    if (result == 'NaN') result = 'Error';
    if (result.toString().endsWith(".0")) {
      result = int.parse(result.toString().replaceAll(".0", "")).toString();
    }else{
      result = result.toString();
    }
  } catch (e) {
    print('error $e');
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
    ..left(char('*').trim(), (a, op, b) => a * b);

  builder.group()
    ..left(char('/').trim(), (a, op, b) => a / b)
    ..left(char('%').trim(), (a, op, b) => a % b);
  builder.group()
  ..left(char('+').trim(), (a, op, b) => a + b)
  ..left(char('-').trim(), (a, op, b) => a - b);

  builder.group()
    ..left(char(kCosSign).trim(), (a, op, b) => a * math.cos(b));
  return builder;
}

buildExpressionComplex(){
  final builder = ExpressionBuilder();
  builder.group()
  ..primitive(digit()
      .plus()
      .seq(char('.').seq(digit().plus()).optional())
      .flatten()
      .trim()
      .map((a) => num.tryParse(a)))
  ..wrapper(char('(').trim(), char(')').trim(), (l, a, r) => a);

  builder.group()
      ..prefix(char(kSquareRootSign).trim(), (l, op) => math.sqrt(op));
    builder.group()
      ..left(char(kSquareRootSign).trim(), (a, op, b) => a*math.sqrt(b));
    builder.group()
      ..left(string(kSinSign).trim(), (a, op, b) => a*(math.sin(b)));
    builder.group()
      ..prefix(string(kSinSign).trim(), (op, l) => math.sin(l));
    builder.group()
      ..left(string(kCosSign).trim(), (a, op, b) => a*(math.cos(b)));
    builder.group()
      ..prefix(string(kCosSign).trim(), (op, l) => math.cos(l));
    builder.group()
      ..left(string(kTanSign).trim(), (a, op, b) => a*(math.tan(b)));
    builder.group()
      ..prefix(string(kTanSign).trim(), (op, l) => math.tan(l));
    builder.group()
      ..left(string(kLogSign).trim(), (a, op, b) => a*(math.log(b)/math.ln10))
      ..prefix(string(kLogSign).trim(), (op, l) => math.log(l)/math.ln10);
      
  builder.group()
    ..left(char('*').trim(), (a, op, b) => a * b);

  builder.group()
    ..left(char('/').trim(), (a, op, b) => a / b)
    ..left(char('%').trim(), (a, op, b) => a % b);
  builder.group()
  ..left(char('+').trim(), (a, op, b) => a + b)
  ..left(char('-').trim(), (a, op, b) => a - b);

  return builder;
}