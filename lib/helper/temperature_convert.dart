String getCalculatedTemperature(input1Mode, input2Mode, parsedValue) {
  print('$input1Mode $input2Mode $parsedValue');
  switch (input1Mode) {
    case '°C':
      parsedValue = parsedValue + 273.15;
      break;
    case '°F':
      parsedValue = (parsedValue - 32) * 5 / 9 + 273.15;
      break;
    case '°Ra':
      parsedValue = parsedValue * 5 / 9;
      break;
    case '°Re':
      parsedValue = (parsedValue - 7.5) * 40 / 21 + 273.15;
      break;
    default:
      break;
  }
  switch (input2Mode) {
    case '°C':
      parsedValue = parsedValue - 273.15;
      break;
    case '°F':
      parsedValue = (parsedValue - 273.15) * 9 / 5 + 32;
      break;
    case '°Ra':
      parsedValue = parsedValue * 1.8;
      break;
    case '°Re':
      parsedValue = parsedValue * 21 / 40 + 7.5;
      break;
    default:
      break;
  }
  return parsedValue.toStringAsFixed(2);
}
