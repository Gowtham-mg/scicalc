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
        ..prefix(string('pi').trim(), (l, op) => math.sqrt(op))
        ..left(string('pi').trim(), (a, op, b) => a*math.sqrt(b));
    
    builder.group()
        ..prefix(char(kPiSign).trim(), (l, op) => math.pi)
        ..left(char(kPiSign).trim(), (a, op, b) => a*math.pi);
    
    builder.group()
        ..left(string(kSinSign).trim(), (a, op, b) => a*(math.sin(b)))
        ..prefix(string(kSinSign).trim(), (op, l) => math.sin(l));
    
    builder.group()
        ..left(string(kCosSign).trim(), (a, op, b) => a*(math.cos(b)))
        ..prefix(string(kCosSign).trim(), (op, l) => math.cos(l));
    
    builder.group()
        ..left(string(kTanSign).trim(), (a, op, b) => a*(math.tan(b)))
        ..prefix(string(kTanSign).trim(), (op, l) => math.tan(l));
    
    builder.group()
        ..left(string(kLogSign).trim(), (a, op, b) => a*(math.log(b)/math.ln10))
        ..prefix(string(kLogSign).trim(), (op, l) => math.log(l)/math.ln10);
      
    builder.group()
        ..left(string(kLonSign).trim(), (a, op, b) => a*(math.log(b)))
        ..prefix(string(kLonSign).trim(), (op, l) => math.log(l));

    builder.group()
        ..left(char('C').trim(), (a, op, b) => factorial(a)/((factorial(a-b))*factorial(b)))
        ..left(char('P').trim(), (a, op, b) => factorial(a)/factorial(a-b));
      
    builder.group()
        ..left(char('^').trim(), (a, op, b) => math.pow(a, b));
    
    builder.group()
        ..left(string('^-1').trim(), (a, op, b) => math.pow(a, -b));

    builder.group()
        ..left(string(kExponentialSign).trim(), (a, op, b) => a*(math.exp(b)))
        ..prefix(string(kExponentialSign).trim(), (op, l) => math.exp(l));

    builder.group()
        ..prefix(string('factorial').trim(), (l,op) => 1);
        
    builder.group()
        ..prefix(string(kSinh).trim(), (op, l) => ((math.exp(l)) - math.exp(-l))/2);

    builder.group()
        ..prefix(string(kCosh).trim(), (op, l) => (math.exp(l) + math.exp(-l))/2);
    
    builder.group()
        ..prefix(string(kTanh).trim(), (op, l) => (math.exp(l) - math.exp(-l))/(math.exp(l) + math.exp(-l)));
    
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
}
