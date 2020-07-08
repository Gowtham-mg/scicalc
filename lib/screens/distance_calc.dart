import 'dart:math';

import 'package:flutter/material.dart';

import '../calc_constants.dart';
import '../helper/length_convert.dart';
import '../helper/speed_convert.dart';
import '../helper/temperature_convert.dart';

class DistanceCalc extends StatefulWidget {
  final String calcMode;
  final String input1ModeInitialValue;
  final String input2ModeInitialValue;
  DistanceCalc(this.calcMode, this.input1ModeInitialValue, this.input2ModeInitialValue);
  @override
  _DistanceCalcState createState() => _DistanceCalcState();
}

class _DistanceCalcState extends State<DistanceCalc> {

  var input1controller = TextEditingController(text: '');

  var input2controller = TextEditingController(text: '');

  final Widget sizedBox = SizedBox(width: 10,);

  List<String> calcDropDownButtons = [];

  String input1Mode = '';
  
  String input2Mode = '';

  String input1 = '0';

  String input2 = '0';

  bool isInput1Changed = false;

  bool isInput1ModeChanged = false;

  void convertDistance(){
    print('');
    print('input2Mode: $input2Mode');
    print('input1Mode: $input1Mode');
    print('value1: $input1');
    print('value2: $input2');
    print('isInput1Changed: $isInput1Changed');
    var len1; 
    var len2;
    
    if(isInput1Changed){
      len1 = int.tryParse(input1) ?? double.tryParse(input1) ?? 'invalid input';
      if(len1 == 'invalid input') return;
    }else{
      len2 = int.tryParse(input2) ?? double.tryParse(input2) ?? 'invalid input';
      if(len2 == 'invalid input') return;
    }
    print('len1: $len1');
    print('len2: $len2');
    print('isInput1ModeChanged $isInput1ModeChanged');    

    num parsedValue = isInput1Changed || isInput1ModeChanged ? len1 : len2;
    num calculatedValue;
    print('parsedValue: $parsedValue');
    switch(widget.calcMode){
      case 'distance_calc': calculatedValue = isInput1ModeChanged && isInput1Changed ? getCalculatedLength(input1Mode, input2Mode, parsedValue) : getCalculatedLength(input2Mode, input1Mode, parsedValue);
        break;
      case 'speed_calc': calculatedValue = isInput1ModeChanged && isInput1Changed ? getCalculatedSpeed(input1Mode, input2Mode, parsedValue) : getCalculatedSpeed(input2Mode, input1Mode, parsedValue);
        break;
      case 'temperature_calc': calculatedValue = isInput1ModeChanged && isInput1Changed ? getCalculatedTemperature(input1Mode, input2Mode, parsedValue) : getCalculatedTemperature(input2Mode, input1Mode, parsedValue);
        break;
    }
        
    if(isInput1Changed){
      input2controller.text = calculatedValue.toString();
    }else{
      input1controller.text = calculatedValue.toString();
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    print(widget.calcMode);
    switch(widget.calcMode){
      case 'distance_calc': calcDropDownButtons = kDistanceCalc; break;
      case 'speed_calc': calcDropDownButtons = kSpeedCalc; break;
      case 'temperature_calc': calcDropDownButtons = kTemperatureCalc; break;
    }
    input1Mode = widget.input1ModeInitialValue;
    input2Mode = widget.input2ModeInitialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizedBox,
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                  DropdownButton<String>(
                      items: calcDropDownButtons.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: input1Mode,
                      onChanged: (val) {
                        setState(() {
                          isInput1ModeChanged = true;
                          input1Mode = val;
                          convertDistance();
                        });
                      },
                    ),
                  TextField(
                    controller: input1controller,
                        keyboardType: TextInputType.number,
                        cursorRadius: Radius.circular(2),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2
                            ),
                          )
                        ),
                        onChanged: (value){
                          setState(() {
                            print('value1: $value');
                            isInput1Changed = true;
                            isInput1ModeChanged = true;
                            input1 = value;
                            print('isInput1Changed: $isInput1Changed');
                            convertDistance();
                          });
                        },
                      ),
                ]
              ),
            ),
            sizedBox,
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                  DropdownButton<String>(
                      items: calcDropDownButtons.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: input2Mode,
                      onChanged: (val) {
                        setState(() {
                          isInput1ModeChanged = false;
                          input2Mode = val;
                          convertDistance();
                        });
                      },
                    ),
                  TextField(
                    controller: input2controller,
                      keyboardType: TextInputType.number,
                      cursorRadius: Radius.circular(2),
                      cursorWidth: 2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2
                          ),
                        )
                      ),
                      onChanged: (value){
                      setState(() {
                        print('value2: $value');
                        isInput1Changed = false;
                        isInput1ModeChanged = false;
                        input2 = value;
                        print('isInput1Changed: $isInput1Changed');
                        convertDistance();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,)
          ],
        );
  }
}