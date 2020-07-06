import 'package:scicalc/calc_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final result = StateProvider((ref)=>0);
var operator1 = '';
splitExpressions(String _expression, context){
  num a = result.read(context).state;
  num b = 0;
  List expressionList;
  bool isOperand = false;
  print('expression $_expression');
  expressionList = _expression.split(' ');
  print('expressionList $expressionList');

  for (var i=0; i < expressionList.length; i++){
    try{
      num x = int.parse(expressionList[i].trim());
      print('num $x');
      isOperand = true;
      if(isOperand && a==0){
        a = x;
      }else if(isOperand && b==0){
        b = x;
      }
    }catch(e){
      bool isArithmeticOperator = arithmetic.contains(expressionList[i]);
      if(isOperand && operator1 == ''){
        operator1 = expressionList[i];
      }
      print('operator1 $operator1');
    }
      if(operator1 != '' && a != null && b != null){
        result.read(context).state = calculate(a, b);
        print('result ${result.read(context).state}');
        operator1 = null;
      }
    }
  }
calculate(num a, num b){
  switch(operator1){
    case '+': return a+b;
    case '-': return a-b;
    case '*': return a*b;
    case '/': return a/b;
    case '%': return a%b;
  }
}
