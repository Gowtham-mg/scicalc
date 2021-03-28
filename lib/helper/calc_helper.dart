import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petitparser/petitparser.dart';
import 'package:function_tree/function_tree.dart';

import '../calc_constants.dart';
import '../model/build_expression_class.dart';
import '../screens/modes_of_calc.dart';

String result = '';
final inputExpression = StateProvider((ref) => '');
var tempExpression = '';
final ExpressionBuilder expressionBuilder =
    BuildExpressionClass().buildExpressionComplex();
var parser;

void evaluate(context, exp, operand) {
  print('operand $operand');

  tempExpression = exp;
  switch (operand) {
    case kClearAllSign:
      _clear();
      break;
    case kDelSign:
      _deleteValue();
      break;
    case kEqualSign:
      keyboardType.read(context).state
          ? _calculateScientificCalculator()
          : _calculateSimpleResult();
      break;
    case '+/-':
      _negateResult();
  }

  inputExpression.read(context).state =
      operand == kEqualSign || operand == '+/-' ? result : tempExpression;
}

void _clear() {
  result = '';
  tempExpression = '';
}

void _negateResult() {
  print('ngateResult');
  result = result.isEmpty
      ? (-1 * (int.parse(tempExpression))).toString()
      : (-1 * (int.parse(result))).toString();
}

void _deleteValue() {
  tempExpression = tempExpression.substring(0, tempExpression.length - 3);
  if (tempExpression == '') tempExpression = '0';
}

void _calculateSimpleResult() {
  tempExpression = tempExpression.replaceAll(kDivisionSign, '/');
  tempExpression = tempExpression.replaceAll(kMultiplicationSign, '*');
  parser = expressionBuilder.build();
  _tryComputeResult();
}

void _calculateScientificCalculator() {
  print('1');
  parser = expressionBuilder.build();
  print('tempExpression $tempExpression');
  tempExpression = tempExpression.replaceAll(kPiSign, 'pi');
  tempExpression = tempExpression.replaceAll('!', 'fact');
  tempExpression = tempExpression.replaceAll(kSquareRootSign, 'sqrt');
  tempExpression = tempExpression.replaceAll('^3', 'cube');
  tempExpression = tempExpression.replaceAll(kMultiplicationSign, '*');
  tempExpression = tempExpression.replaceAll(kDivisionSign, '/');
  print('tempExpression $tempExpression');

  _tryComputeResult();
}

void _tryComputeResult() {
  try {
    var temp = parser.parse(tempExpression).toString().split(' ');
    result = temp.last;
    result = tempExpression.interpret().toString();
    print('$result result');
    if (result == 'NaN') result = 'Error';
    if (result.toString().endsWith(".0")) {
      result = int.parse(result.toString().replaceAll(".0", "")).toString();
    } else {
      result = result.toString();
    }
  } catch (e) {
    print('error $e');
  }
}

int factorial(n) {
  if (n > 1)
    return n * factorial(n - 1);
  else
    return 1;
}
