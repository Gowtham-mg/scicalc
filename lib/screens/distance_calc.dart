import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final input1 = StateProvider((ref)=>'');
final input2 = StateProvider((ref)=>'');
final input1Mode = StateProvider((ref)=>'');
final input2Mode = StateProvider((ref)=>'');

class DistanceCalc extends StatelessWidget {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                DropdownButton<String>(
                  items: <String>['mm', 'cm', 'in', 'm', 'km', 'mile', 'ft', 'yd', 'acre', 'm²'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    print(val);
                  },
                ),
                Consumer(
                  (context, read){
                    return TextFormField(
                    keyboardType: TextInputType.number,
                    controller: input1Controller,
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
                    initialValue: read(input1).state,
                    onChanged: (value){
                      input1.read(context).state = value;
                    },
                  );
                  }
                ),
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                DropdownButton<String>(
                  items: <String>['mm', 'cm', 'in', 'm', 'km', 'mile', 'ft', 'yd', 'acre', 'm²'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    print(val);
                  },
                ),
                Consumer(
                  (context, read){
                    return TextFormField(
                    keyboardType: TextInputType.number,
                    controller: input2Controller,
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
                    initialValue: read(input2).state,
                    onChanged: (value){
                      input2.read(context).state = value;
                    },
                  );
                  }
                ),
              ],
            )
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