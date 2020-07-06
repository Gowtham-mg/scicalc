import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matrixKey = StateProvider((ref) => 0);
List matrix2 = List();
List matrix1 = List();  
final _formKey1 = GlobalKey<FormState>(debugLabel: 'Matrix1');
final _formKey2 = GlobalKey<FormState>(debugLabel: 'Matrix2');
List subMatrix = List();

class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      (context, read){
      var tempKey = read(matrixKey).state;
      return Form(
        key: tempKey == 0 ? _formKey1 : _formKey2,
        child: Column(
          children: [
            Text('Limit: Up to 4*4 Matrix', style: TextStyle(
              fontSize: 20
            ),),
            Row(
              children: [
                Expanded(
                  child: ActionChip(
                      label: Text('Matrix1'),
                      onPressed: (){
                        read(matrixKey).state = 0;
                        print(tempKey);
                      },
                  ),
                ),
                Expanded(
                  child: ActionChip(
                      label: Text('Matrix2'),
                      onPressed: (){
                        read(matrixKey).state = 1;
                        print(tempKey);
                      },
                  ),
                )
                
              ],
            ),
            
            Row(children: [
              matrixTextField('m1n1'),
              matrixTextField('m1n2'),
              matrixTextField('m1n3'),
              matrixTextField('m1n4')
            ],),
            Row(children: [
              matrixTextField('m2n1'),
              matrixTextField('m2n2'),
              matrixTextField('m2n3'),
              matrixTextField('m2n4')
            ],),
            Row(children: [
              matrixTextField('m3n1'),
              matrixTextField('m3n2'),
              matrixTextField('m3n3'),
              matrixTextField('m3n4')
            ],),
            Row(children: [
              matrixTextField('m3n1'),
              matrixTextField('m3n2'),
              matrixTextField('m3n3'),
              matrixTextField('m3n4')
            ],),
            RaisedButton(
              child: Text('Result'),
              onPressed: (){
                matrixKey == 0 ? _formKey1.currentState.save() : _formKey2.currentState.save();
                print(subMatrix);
                for(int i = 0; i<16; i+4){
                  matrixKey == 0 ? matrix1.add(subMatrix.sublist(i,i+4).toList()) : matrix2.add(subMatrix.sublist(i,i+4).toList());
                }
              },
            ),
          ]
        ),
        );
      } 
    );
  }
}


matrixTextField (String text){
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey.shade500
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        ),
        key: ValueKey(text),
        onSaved: (text){
          subMatrix.add(text);
        },
        style: TextStyle(
          color: Colors.black
        ),
      ),
    )
  );
}