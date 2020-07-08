import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}