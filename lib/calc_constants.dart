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
const kClearSign = 'AC';
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


const keyboardSingleCalculator = [
  [kClearSign, kNegate, kModulusSign, kDivisionSign],
  [kMultiplicationSign, kSeven, kEight, kNine],
  [kMinusSign, kFour, kFive, kSix],
  [kPlusSign, kOne, kTwo, kThree],
  [kEqualSign, kDecimalPointSign, kZero, kDelSign]
];

const keyboardScientificCalculator = [
  [kLeftParanthesis, kRightParanthesis, kSineSign, kCosSign, kTanSign,kLogSign, kRadSign],
  [kDivisionSign, kClearSign, kDelSign, kModulusSign, kLonSign, kLon2Sign, kBinSign],
  [kMultiplicationSign, kSeven, kEight, kNine, kPowerSign, kDegSign, kOctalSign],
  [kMinusSign, kFour, kFive, kSix, kSquareRootSign, kArcSineSign, kHexaDecimalSign],
  [kPlusSign, kOne, kTwo, kThree, kPiSign, kArcCosSign, kDecimalSign],
  [kEqualSign, kESign, kZero, kDecimalPointSign, kNegate, kArcTanSign, kChangeMode]
];