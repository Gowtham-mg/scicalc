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
const kCotSign = 'cot';
const kModulusSign = '%';
const kSinSign = 'sin';
const kCosSign = 'cos';
const kTanSign = 'tan';
const kRadSign = 'rad';
const kDegSign = 'deg';
const kSinInverseSign = 'sin-1';
const kCosInverseSign = 'cos-1';
const kTanInverseSign = 'tan-1';
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
const kSinh = 'sinh'; 
const kCosh = 'cosh'; 
const kTahh = 'tanh'; 
const kSinhInverse = 'sinh−1'; 
const kCoshInverse = 'cosh-1';
const kTanhInverse = 'tanh-1';

const kAppBarTitleConstant = 'SciCalc';

const arithmetic = [kPlusSign, kMinusSign, kMultiplicationSign, kDivisionSign, kModulusSign];

const complex = [kSinSign, kCosSign, kTanSign, kLogSign, kSinInverseSign, kCosInverseSign, kTanInverseSign];

const List<String> evalSpecialCharacters = [kEqualSign, kClearAllSign, kDelSign];

const List<String> kDistanceCalc = ['nm', 'µm', 'mm', 'cm', 'in', 'm', 'km', 'mile', 'nmi', 'ft', 'yd'];

const List<String> kTemperatureCalc = ['°C', '°F', 'K', '°Ra', '°Re'];

const List<String> kSpeedCalc = ['mph', 'ft/s', 'm/s', 'kt', 'kph'];

const keyboardSimpleCalculator = [
  [kClearAllSign, kNegate, kModulusSign, kDivisionSign],
  [kMultiplicationSign, kSeven, kEight, kNine],
  [kMinusSign, kFour, kFive, kSix],
  [kPlusSign, kOne, kTwo, kThree],
  [kEqualSign, kDecimalPointSign, kZero, kDelSign]
];

const keyboardScientificCalculator = [
  [kLeftParanthesis, kRightParanthesis, kSinSign, kCosSign, kTanSign,kLogSign],
  [kDivisionSign, kClearAllSign, kDelSign, kModulusSign, kLonSign, kCotSign],
  [kMultiplicationSign, kSeven, kEight, kNine, kPowerSign, kDegSign],
  [kMinusSign, kFour, kFive, kSix, kSquareRootSign, kSinInverseSign],
  [kPlusSign, kOne, kTwo, kThree, kPiSign, kCosInverseSign],
  [kEqualSign, kESign, kZero, kDecimalPointSign, kNegate, kTanInverseSign],
  [kSinh, kCosh, kTahh, kSinhInverse, kCoshInverse,kTanhInverse],
];

const kMatrixAddition = 'Add Two Matrix';
const kMatrixAddScalar = 'Add Matrix & Scalar';
// const kMatrixAddVector = 'Add Matrix & Vector';
const kMatrixMultiplyVector = 'Multiply Matrix & vector';
// const kCreateDiagonalMatrix = 'Create Diagonal Matrix';
// const kCreateScalarMatrix = 'Create Scalar Matrix';
const kMatrixMultiplication = 'Multiply two Matrix';
const kMatrixMultiplyScalar = 'Multiply Matrix & Scalar';
const kElementWiseMultiplication = 'Element-wise Matrix Product';
const kElementWiseSubtraction = 'Element-wise Matrix Subtraction';
// const kMatrixTransposition = 'Matrix Transposition';
// const kReduceRowWise = 'Matrix row-wise reduce';
// const kReduceColumnWise = 'Matrix column-wise reduce';
// const kMatrixSumElements = 'Sum of matrix elements';
// const kMatrixProductElements = 'Product of matrix elements';
// const kMatrixMaxValue = 'Max value of Matrix';
// const kMatrixMinValue = 'Min value of Matrix';
const kMatrixOperations = [
  kMatrixAddition, kMatrixAddScalar, kMatrixMultiplyVector, kMatrixMultiplication, kMatrixMultiplyScalar, kElementWiseMultiplication,
  kElementWiseSubtraction
];
// const kColumnWiseMapping = 'Matrix row-wise mapping';
// const kRowWiseMapping = 'Matrix column-wise mapping';
// const kElemntWiseMapping = 'Matrix element-wise mapping';
// 'Matrix element-wise power';
// 'Matrix element-wise exp';



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