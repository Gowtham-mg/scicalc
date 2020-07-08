import 'package:flutter/material.dart';
import 'package:scicalc/model/matrix_calc.dart';


List matrix2 = List();
List matrix1 = List();
List subMatrix = List();

class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  
  final _formKey1 = GlobalKey<FormState>(debugLabel: 'Matrix1');
  
  final _formKey2 = GlobalKey<FormState>(debugLabel: 'Matrix2');

  final matrixFieldObject1 = MatrixForm();

  final matrixFieldObject2 = MatrixForm();

  bool matrixChosen = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
            children: [
              Text('Limit: Up to 4*4 Matrix', style: TextStyle(
                fontSize: 20
              ),),
              Chip(
                label: Text('Matrix1'),
              ),
              Flexible(
                child: Form(
                  key: _formKey1,
                  child: ListView(
                    children: 
                      matrixFieldObject1.matrixfields.map((key, value) => MapEntry(key,matrixTextField(key, value[0], value[1]))).values.toList(),
                  ),
                ),
              ),
              Chip(
                label: Text('Matrix2'),
              ),
              Expanded(
                child: Form(
                  key: _formKey2,
                  child: ListView(
                    children: 
                      matrixFieldObject2.matrixfields.map((key, value) => MapEntry(key,matrixTextField(key, value[0], value[1]))).values.toList(),
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Result'),
                onPressed: (){
                  _formKey1.currentState.save();
                  _formKey2.currentState.save();
                  print(matrixFieldObject1.matrixfields.map((key, value) => MapEntry(key,[value[0],value[1].text])).values.toList());
                  print(matrixFieldObject2.matrixfields.map((key, value) => MapEntry(key,[value[0],value[1].text])).values.toList());
                },
              ),
            ],
          ),
      ),
    );
  }
}


Widget matrixTextField (_index, String _text, TextEditingController _controller){
  print(_index);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
    child: TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _text,
        hintStyle: TextStyle(
          color: Colors.grey.shade500
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
      key: ValueKey(_text),
      onSaved: (text){
        subMatrix.add(text);
      },
      style: TextStyle(
        color: Colors.black
      ),
    ),
  );
}