String getCalculatedLength(input1Mode, input2Mode, parsedValue) {
  print('$input1Mode $input2Mode $parsedValue');
  switch (input1Mode) {
    case 'mm':
      parsedValue = parsedValue / 1000;
      break;
    case 'cm':
      parsedValue = parsedValue / 100;
      break;
    case 'in':
      parsedValue = parsedValue * 0.0254;
      break;
    case 'km':
      parsedValue = parsedValue * 1000;
      break;
    case 'mile':
      parsedValue = parsedValue * 1609.34;
      break;
    case 'ft':
      parsedValue = parsedValue * 0.3048;
      break;
    case 'yd':
      parsedValue = parsedValue * 0.9144;
      break;
    case 'nm':
      parsedValue = parsedValue / 1e+9;
      break;
    case 'µm':
      parsedValue = parsedValue / 1e+6;
      break;
    case 'nmi':
      parsedValue = parsedValue * 1852;
      break;
    default:
      break;
  }
  switch (input2Mode) {
    case 'mm':
      parsedValue = parsedValue * 1000;
      break;
    case 'cm':
      parsedValue = parsedValue * 100;
      break;
    case 'in':
      parsedValue = parsedValue * 39.3701;
      break;
    case 'm':
      parsedValue = parsedValue * 0.001;
      break;
    case 'km':
      parsedValue = parsedValue * 0.001;
      break;
    case 'mile':
      parsedValue = parsedValue / 0.000621371;
      break;
    case 'ft':
      parsedValue = parsedValue * 3.28084;
      break;
    case 'yd':
      parsedValue = parsedValue * 1.09361;
      break;
    case 'nm':
      parsedValue = parsedValue * 1000000000;
      break;
    case 'µm':
      parsedValue = parsedValue * 1000000;
      break;
    case 'nmi':
      parsedValue = parsedValue * 0.000539957;
      break;
    default:
      break;
  }
  return parsedValue.toStringAsFixed(4);
}
