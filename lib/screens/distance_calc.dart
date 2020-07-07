import 'package:flutter/material.dart';

import 'package:scicalc/helper/length_convert.dart';

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

  bool isInput1ModeChanged = false;
  
  void convertDistance(){
    print('');
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
    num parsedValue = isInput1Changed ? len1 : len2;
    num calculatedValue = isInput1ModeChanged && isInput1Changed ? getCalculatedLength(input1Mode, input2Mode, parsedValue) : getCalculatedLength(input2Mode, input1Mode, parsedValue);
    
    if(isInput1Changed){
      input2controller.text = calculatedValue.toString();
    }else{
      input1controller.text = calculatedValue.toString();
    }
    setState(() {
      
    });
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
                      items: <String>['nm', 'µm', 'mm', 'cm', 'in', 'm', 'km', 'mile', 'nmi', 'ft', 'yd'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
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
                  DropdownButton<String>(
                      items: <String>['nm', 'µm', 'mm', 'cm', 'in', 'm', 'km', 'mile', 'nmi', 'ft', 'yd'].map((String value) {
                        return new DropdownMenuItem<String>(
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