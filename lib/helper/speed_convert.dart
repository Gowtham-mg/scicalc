
String getCalculatedSpeed(input1Mode, input2Mode, parsedValue){
    print('$input1Mode $input2Mode $parsedValue');
    switch(input1Mode){
      case 'mph': parsedValue = parsedValue * 1.609;break;
      case 'ft/s': parsedValue = parsedValue * 1.097;break;
      case 'm/s': parsedValue = parsedValue * 3.6;break;
      case 'kt': parsedValue = parsedValue * 1.852;break;
      default: break;
    }
    switch(input2Mode){
      case 'mph': parsedValue = parsedValue /1.609;break;
      case 'ft/s': parsedValue = parsedValue / 1.097;break;
      case 'm/s': parsedValue = parsedValue / 3.6;break;
      case 'kt': parsedValue = parsedValue / 1.852;break;
      default: break;
    }
    return parsedValue.toStringAsFixed(4);
}