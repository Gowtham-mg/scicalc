import 'package:flutter/material.dart';

const kPlusSign = '+';
const kMinusSign = '-';
const kMultiplicationSign = '×';
const kDivisionSign = '÷';
const kDecimalPointSign = '.';
const kPowerSign = 'X^';
const kSquareRootSign = '√';
const kLogSign = 'lg';
const kLonSign = 'ln';
const kLon2Sign = 'ln2';
const kModulusSign = '%';
const kSineSign = 'sin';
const kCosSign = 'cos';
const kTanSign = 'tan';
const kRadSign = 'rad';
const kDegSign = 'deg';
const kArcSineSign = 'asin';
const kArcCosSign = 'acos';
const kArcTanSign = 'atan';
const kLeftParanthesis = '(';
const kRightParanthesis = ')';
const kEqualSign = '=';
const kClearAllSign = 'AC';
const kPiSign = 'π';
const kESign = 'e';
const kDelSign = '⌫';
const kCalcError = 'Error';
const kChangeMode = '⌞⌝';
const kOne = '1';
const kTwo = '2';
const kThree = '3';
const kFour = '4';
const kFive = '5';
const kSix = '6';
const kSeven = '7';
const kEight = '8';
const kNine = '9';
const kZero = '0';
const kNegate = '+/-';
const kBinSign = '10^2';
const kOctalSign = '10^8';
const kHexaDecimalSign = '10^16';
const kDecimalSign = '10^10';
const kotherCharacters = '';

const kAppBarTitleConstant = 'SciCalc';

const arithmetic = [kPlusSign, kMinusSign, kMultiplicationSign, kDivisionSign, kModulusSign];

const List<String> evalSpecialCharacters = [kEqualSign, kClearAllSign, kDelSign];

const List<String> kDistanceCalc = ['nm', 'µm', 'mm', 'cm', 'in', 'm', 'km', 'mile', 'nmi', 'ft', 'yd'];

const List<String> kTemperatureCalc = ['°C', '°F', 'K', '°Ra', '°Re'];

const List<String> kSpeedCalc = ['nm', 'µm', 'mm', 'cm', 'in', 'm', 'km', 'mile', 'nmi', 'ft', 'yd'];

const keyboardSimpleCalculator = [
  [kClearAllSign, kNegate, kModulusSign, kDivisionSign],
  [kMultiplicationSign, kSeven, kEight, kNine],
  [kMinusSign, kFour, kFive, kSix],
  [kPlusSign, kOne, kTwo, kThree],
  [kEqualSign, kDecimalPointSign, kZero, kDelSign]
];

const keyboardScientificCalculator = [
  [kLeftParanthesis, kRightParanthesis, kSineSign, kCosSign, kTanSign,kLogSign],
  [kDivisionSign, kClearAllSign, kDelSign, kModulusSign, kLonSign, kLon2Sign],
  [kMultiplicationSign, kSeven, kEight, kNine, kPowerSign, kDegSign],
  [kMinusSign, kFour, kFive, kSix, kSquareRootSign, kArcSineSign],
  [kPlusSign, kOne, kTwo, kThree, kPiSign, kArcCosSign],
  [kEqualSign, kESign, kZero, kDecimalPointSign, kNegate, kArcTanSign]
];

const kbottomContainerHeight = 80.0;
const kWhiteColor = Colors.white;

const klabelTextStyle =  TextStyle(
  fontSize: 18.0,color: Color(0xFF8D8E98),
);

const knumberTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold
);

const kresultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontWeight: FontWeight.bold,
  fontSize: 22.0
);

const kBmiTextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);