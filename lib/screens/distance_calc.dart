import 'package:flutter/material.dart';
import 'dart:math' as math;

class DistanceCalc extends StatefulWidget {
  @override
  _DistanceCalcState createState() => _DistanceCalcState();
}

class _DistanceCalcState extends State<DistanceCalc> {

  var input1controller = TextEditingController(text: '');

  var input2controller = TextEditingController(text: '');


  final Widget sizedBox = SizedBox(width: 10,);

  String input1Mode = 'cm';

  String input2Mode = 'km';

  String input1 = '0';

  String input2 = '0';

  bool isInput1Changed = false;

  bool isInput2Changed = false;
  
  void convertDistance(){
    print('');
    print('value1: $input1');
    print('value2: $input2');
    print('isInput1Changed: $isInput1Changed');
    print('isInput2Changed: $isInput2Changed');

    var len1; 
    len1 = input1;
    var len2;
    len2 = input2;
    try{
      if(len1.contains('.')){
        len1 = double.parse(len1);
        len2 = double.parse(len2);
      }else{
        len1 = int.parse(len1);
        len2 = int.parse(len2);
      }
    }catch(e){
      return;
    }
    
    print('after parsing value1: $input1 $len1');
    print('after parsing value2: $input2 $len2');
    print('input1mode: $input1Mode');
    print('input2mode: $input2Mode');

    switch(input1Mode){
      case 'mm': break;
      case 'cm': len1 = len1 * 10;break;
      case 'in': len1 = len1 * 25.4;break;
      case 'm': len1 = len1 * 1000;break;
      case 'km': len1 = len1 * 1000000;break;
      case 'mile': len1 = len1 * 1609000000;break;
      case 'ft': len1 = len1 * 304.8;break;
      case 'yd': len1 = len1 * 914.4;break;
    }
    print('len1: $len1');

    switch(input2Mode){
      case 'mm': len2 = len1;break;
      case 'cm': len2 = len1 * 0.1;break;
      case 'in': len2 = len1 * 0.0393701;break;
      case 'm': len2 = len1 * 0.001;break;
      case 'km': len2 = len1 * math.pow(10, -6);break;
      case 'mile': len2 = (len1 * 6.2137) * math.pow(10, -7);break;
      case 'ft': len2 = len1 * 0.00328084;break;
      case 'yd': len2 = len1 * 0.00109361;break;
    }
    if(isInput1Changed){
      input1controller.text = len2.toString();
    }
    if(isInput2Changed){
      input2controller.text = len1.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizedBox,
            Expanded(
              child: Column(
                children: [
                  DropdownButton<String>(
                      items: <String>['mm', 'cm', 'in', 'm', 'km', 'mile', 'ft', 'yd'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      value: input1Mode,
                      onChanged: (val) {
                        setState(() {
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
                            isInput2Changed = false;
                            input1 = value;
                            print('isInput1Changed: $isInput1Changed');                        
                            print('isInput2Changed: $isInput2Changed');
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
                  DropdownButton<String>(
                      items: <String>['mm', 'cm', 'in', 'm', 'km', 'mile', 'ft', 'yd'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: input2Mode,
                      onChanged: (val) {
                        setState(() {
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
                        isInput2Changed = true;
                        input2 = value;
                        print('isInput1Changed: $isInput1Changed');
                        print('isInput2Changed: $isInput2Changed');
                        convertDistance();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        SizedBox(height: 10,),
        RaisedButton(
          child: Text('Calculate'),
          onPressed: (){
            print('Calculate result');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text('Result', style: TextStyle(letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),)
      ],
    );
  }
}