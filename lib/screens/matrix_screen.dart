import 'package:flutter/material.dart';
import 'package:scicalc/calc_constants.dart';
import 'package:scicalc/model/matrix_calc.dart';
import 'package:ml_linalg/linalg.dart';

List matrix2 = List();
List matrix1 = List();
List subMatrix = List();

class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  
  final _formKey1 = GlobalKey<FormState>(debugLabel: 'Matrix1');
  
  final matrixFormObject = MatrixForm();
  
  final matrix1Controller =  TextEditingController();
  
  final matrix2Controller =  TextEditingController();

  String inputMode = kMatrixAddition;

  String matrixDimension = '4*4';
  
  var result;

  bool matrixChosen = true;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Spacer(flex: 4,),
          DropdownButton<String>(
            items: kMatrixOperations.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: inputMode,
            onChanged: (val) {
              setState(() {
                inputMode = val;
              });
            },
          ),
          Spacer(flex: 1,),
          DropdownButton<String>(
            items: kMatrixOperationDimensions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: matrixDimension,
            onChanged: (val) {
              setState(() {
                matrixDimension = val;
              });
            },
          ),
          Spacer(flex: 1,),
          Row(
            children: [
              Spacer(flex: 1,),
              buildChip('Matrix1'),
              Spacer(flex: 2,),
              buildChip('Matrix2'),
              Spacer(flex: 1,),
            ],
          ),
          Spacer(flex: 1,),
          Form(
            key: _formKey1,
            child: Row(
              children: [
                SizedBox(width: 10,),
                Expanded(child: TextFormFieldMatrix(matrixController: matrix1Controller)),
                SizedBox(width: 10,),
                Expanded(child: TextFormFieldMatrix(matrixController: matrix2Controller)),
                SizedBox(width: 10,),
              ]
            ),
          ),
          Spacer(flex: 1,),
          RaisedButton(
            child: Text('Result'),
            onPressed: (){
              _formKey1.currentState.save();
              
              var newList1 = matrixFormObject.fieldToList(matrix1Controller.text);

              var newList2 = matrixFormObject.fieldToList(matrix2Controller.text);

              var dimension = matrixDimension.split('*');
              print(newList1);
              print(newList2);
              setState(() {
                result = matrixFormObject.calculate(inputMode, newList1, newList2, int.parse(dimension[0]), int.parse(dimension[1]));
              });
            },
          ),
          Text(result.toString()),
          Spacer(flex: 10,),
        ],
      );
  }

}

class TextFormFieldMatrix extends StatelessWidget {
  const TextFormFieldMatrix({
    Key key,
    @required this.matrixController,
  }) : super(key: key);

  final TextEditingController matrixController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: matrixController,
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
        print('value1: $value');
      }  
    );
  }
}

Chip buildChip(String text) {
  return Chip(
    label: Text(text),
  );
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