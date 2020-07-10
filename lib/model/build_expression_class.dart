import '../helper/calc_helper.dart';
import 'package:petitparser/petitparser.dart';
import 'dart:math' as math;
import '../calc_constants.dart';

class BuildExpressionClass{

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
        ..prefix(string('sqrt').trim(), (l, op) => math.sqrt(op))
        ..left(string('sqrt').trim(), (a, op, b) => a*math.sqrt(b))
        
        ..postfix(string('pi').trim(), (l, op) => l * math.pi)
        ..left(string('pi').trim(), (a, op, b) => a*math.pi)

        ..left(string(kSinSign).trim(), (a, op, b) => a*(math.sin(b)))
        ..prefix(string(kSinSign).trim(), (op, l) => math.sin(l))

        ..left(string(kCosSign).trim(), (a, op, b) => a*(math.cos(b)))
        ..prefix(string(kCosSign).trim(), (op, l) => math.cos(l))
        
        ..left(string(kTanSign).trim(), (a, op, b) => a*(math.tan(b)))
        ..prefix(string(kTanSign).trim(), (op, l) => math.tan(l))
        
        ..left(string(kLogSign).trim(), (a, op, b) => a*(math.log(b)/math.ln10))
        ..prefix(string(kLogSign).trim(), (op, l) => math.log(l)/math.ln10)
        
        ..left(string(kLonSign).trim(), (a, op, b) => a*(math.log(b)))
        ..prefix(string(kLonSign).trim(), (op, l) => math.log(l))
        
        ..left(char('C').trim(), (a, op, b) => factorial(a)/((factorial(a-b))*factorial(b)))
        ..left(char('P').trim(), (a, op, b) => factorial(a)/factorial(a-b))
        
        ..left(char('^').trim(), (a, op, b) => math.pow(a, b))
        ..left(string('^-1').trim(), (a, op, b) => math.pow(a, -b))
        
        ..left(string(kExponentialSign).trim(), (a, op, b) => a*(math.exp(b)))
        ..prefix(string(kExponentialSign).trim(), (op, l) => math.exp(l))
        
        ..postfix(string('fact').trim(), (l,op) => factorial(l))
        
        ..prefix(string(kSinh).trim(), (op, l) => ((math.exp(l)) - math.exp(-l))/2)
        ..prefix(string(kCosh).trim(), (op, l) => (math.exp(l) + math.exp(-l))/2)
        ..prefix(string(kTanh).trim(), (op, l) => (math.exp(l) - math.exp(-l))/(math.exp(l) + math.exp(-l)))
      ..left(char('*').trim(), (a, op, b) => a * b)
      ..left(char('/').trim(), (a, op, b) => a / b)
      ..left(char('%').trim(), (a, op, b) => a % b)
    ..left(char('+').trim(), (a, op, b) => a + b)
    ..left(char('-').trim(), (a, op, b) => a - b);
    
    return builder;
  }
}
