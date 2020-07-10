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
        ..prefix(char(kSquareRootSign).trim(), (l, op) => math.sqrt(op))
        ..left(char(kSquareRootSign).trim(), (a, op, b) => a*math.sqrt(b));
    
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
        ..left(string(kCotSign).trim(), (a, op, b) => a*(math.cos(b)/math.sin(b)))
        ..prefix(string(kCotSign).trim(), (op, l) => (math.cos(l)/math.sin(l)));

    builder.group()
        ..left(string(knCr).trim(), (a, op, b) => factorial(a)/(factorial(a-b))*factorial(b))
        ..left(string(knPr).trim(), (a, op, b) => factorial(a)/factorial(a-b));
      
    builder.group()
        ..left(string(kExponentialSign).trim(), (a, op, b) => a*(math.exp(b)))
        ..prefix(string(kExponentialSign).trim(), (op, l) => math.exp(l));
        
    builder.group()
        ..left(string(kSinh).trim(), (a, op, b) => a*((2 * math.exp(b) - math.exp(b))/2))
        ..prefix(string(kSinh).trim(), (op, l) => (2 * math.exp(l) - math.exp(l))/2);

    builder.group()
        ..left(string(kCosh).trim(), (a, op, b) => a*((2 * math.exp(b) + math.exp(b))/2))
        ..prefix(string(kCosh).trim(), (op, l) => (2 * math.exp(l) + math.exp(l))/2);
    
    builder.group()
        ..left(string(kTanh).trim(), (a, op, b) => (a*((2 * math.exp(b) - math.exp(b))/2)/a*((2 * math.exp(b) + math.exp(b))/2)))
        ..prefix(string(kTanh).trim(), (op, l) => ((2 * math.exp(l) - math.exp(l))/2)/((2 * math.exp(l) + math.exp(l))/2));
    
    builder.group()
        ..left(string(klon2Sign).trim(), (a, op, b) => a * (math.log(b) / math.ln2))
        ..prefix(string(klon2Sign).trim(), (op, l) => math.log(l) / math.ln2);
    
        // builder.group()
        // ..left(string(kSinInverseSign).trim(), (a, op, b) => a * (1/(math.sqrt(1-(b*b)))))
        // ..prefix(string(kSinInverseSign).trim(), (op, l) => (1/(math.sqrt(1-(l*l)))));
        // builder.group()
        // ..left(string(kCosInverseSign).trim(), (a, op, b) => -a * (1/(math.sqrt(1-(b*b)))))
        // ..prefix(string(kCosInverseSign).trim(), (op, l) => -1 * (1/(math.sqrt(1-(l*l)))));
        // builder.group()
        // ..left(string(kTanInverseSign).trim(), (a, op, b) => a*(math.exp(b)))
        // ..prefix(string(kTanInverseSign).trim(), (op, l) => math.exp(l));
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