
const kPlusSign = '+';
const kMinusSign = '-';
const kMultiplicationSign = '×';
const kDivisionSign = '÷';
const kDecimalPointSign = '.';
const kPowerSign = 'X^';
const kSquareRootSign = '√';
const kLogSign = 'lg';
const kLonSign = 'ln';
const kModulusSign = '%';
const kSinSign = 'sin';
const kCosSign = 'cos';
const kTanSign = 'tan';
const kRadSign = 'rad';
const kCubeSign = 'x^3';
const kLeftParanthesis = '(';
const kRightParanthesis = ')';
const kEqualSign = '=';
const kClearAllSign = 'AC';
const kPiSign = 'π';
const kExponentialSign = 'e';
const kDelSign = '⌫';
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
const kSinh = 'sinh'; 
const kCosh = 'cosh'; 
const kTanh = 'tanh';
const knCr = 'nCr';
const knPr = 'nPr';
const kFactorial = 'x!';
const kInverse = 'x^-1';
const kSqrtOfHalf = '√1/2';

const kAppBarTitleConstant = 'SciCalc';

const arithmetic = [kPlusSign, kMinusSign, kMultiplicationSign, kDivisionSign, kModulusSign];

const complex = [
  kSinSign, kCosSign, kTanSign, kLogSign, kPiSign, kLonSign, kExponentialSign,
  kSinh, kCosh, kTanh
];

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
  [kLeftParanthesis, kRightParanthesis, kSinSign, kCosSign, kTanSign],
  [kDivisionSign, kClearAllSign, kDelSign, kModulusSign, kLonSign],
  [kMultiplicationSign, kSeven, kEight, kNine, kPowerSign],
  [kMinusSign, kFour, kFive, kSix, kSquareRootSign],
  [kPlusSign, kOne, kTwo, kThree, kPiSign],
  [kEqualSign, kExponentialSign, kZero, kDecimalPointSign, kNegate, ],
  [kLogSign, kCubeSign, kFactorial, kInverse, kSqrtOfHalf],
  [kSinh, kCosh, kTanh, knCr, knPr],
];

const kMatrixAddition = 'Add Two Matrix';
const kMatrixAddScalar = 'Add Matrix & Scalar';
const kMatrixMultiplyVector = 'Multiply Matrix & vector';
const kMatrixMultiplication = 'Multiply two Matrix';
const kMatrixMultiplyScalar = 'Multiply Matrix & Scalar';
const kElementWiseMultiplication = 'Element-wise Matrix Product';
const kElementWiseSubtraction = 'Element-wise Matrix Subtraction';

const kMatrixTranspose = 'Matrix Transposition';
const kReduceRowWise = 'Matrix row-wise reduce';
const kReduceColumnWise = 'Matrix column-wise reduce';
const kMatrixSumElements = 'Sum of matrix elements';
const kMatrixProductElements = 'Product of matrix elements';
const kMatrixMaxValue = 'Max value of Matrix';
const kMatrixMinValue = 'Min value of Matrix';

const kSingleMatrixOperations = [
  kMatrixTranspose, kReduceRowWise, kReduceColumnWise, kMatrixSumElements, kMatrixProductElements,
  kMatrixMaxValue, kMatrixMinValue
];

const kTwoMatrixOperations = [
  kMatrixAddition, kMatrixAddScalar, kMatrixMultiplyVector, kMatrixMultiplication, kMatrixMultiplyScalar, kElementWiseMultiplication,
  kElementWiseSubtraction
];

const kMatrixOperationDimensions = ['1*2','1*3','1*4','2*1','2*2','2*3','2*4','3*1','3*2','3*3','3*4','4*1','4*2','4*3','4*4'];

