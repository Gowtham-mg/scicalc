
num getCalculatedSpeed(input1Mode, input2Mode, parsedValue){
    print('$input1Mode $input2Mode $parsedValue');
    switch(input1Mode){
      case 'celsius': parsedValue = parsedValue + 273.15;break;
      case 'fahrenheit': parsedValue = (parsedValue - 32) * 5 / 9 + 273.15;break;
      case 'rankine': parsedValue = parsedValue * 5 / 9;break;
      case 'romer': parsedValue = (parsedValue - 7.5) * 40 / 21 + 273.15;break;
      default: break;
    }
    switch(input2Mode){
      case 'celsius': parsedValue = parsedValue - 273.15;break;
      case 'fahrenheit': parsedValue = parsedValue * 9 / 5 + 32;break;
      case 'rankine': parsedValue = parsedValue * 1.8;break;
      case 'romer': parsedValue = parsedValue * 21 / 40 + 7.5;break;
      default: break;
    }
    return parsedValue;
}