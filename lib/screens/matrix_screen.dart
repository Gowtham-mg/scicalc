import 'package:flutter/material.dart';

List matrix = [1];
class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  int rows = 4;

  int columns = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Limit: Up to 4*4 Matrix', style: TextStyle(
          fontSize: 20
        ),),
        ...List.generate(rows, (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children:List.generate(columns, (c) => matrixTextField())),
        )),
        Container(
          child: Text(matrix[0].toString())
        ),
      ]
    );
  }
}

matrixTextField (){
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      child: TextFormField(
        onSaved: (text){
          matrix.add(text);
        },
      ),
    )
  );
}