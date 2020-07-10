import 'package:flutter/material.dart';
import '../calc_constants.dart';
import '../bmi_constants.dart';
import '../model/matrix_calc.dart';

List matrix2 = List();
List matrix1 = List();
List subMatrix = List();

enum matrixModes{
  operations,
  transformation
}

class MatrixScreen extends StatefulWidget {
  final matrixModes matrixMode;
  MatrixScreen(this.matrixMode);
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  
  final _formKey1 = GlobalKey<FormState>(debugLabel: 'Matrix1');
  
  final matrixFormObject = MatrixForm();
  
  final matrix1Controller =  TextEditingController();
  
  final matrix2Controller =  TextEditingController();

  String inputMode ='';

  String matrixDimension = '4*4';
  
  var result;

  bool matrixChosen = true;

  List<String> matrixModesList = ['']; 
  
  @override
  void initState() {
    inputMode = widget.matrixMode == matrixModes.operations ? kMatrixAddition : kMatrixTranspose ;
    matrixModesList = widget.matrixMode == matrixModes.operations ? kTwoMatrixOperations : kSingleMatrixOperations ;
    super.initState();
  }

  @override
  void dispose() { 
    if(widget.matrixMode == matrixModes.operations){
      matrix1Controller.clear();
      matrix2Controller.clear();
    }else{
      matrix1Controller.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final matrixMode = widget.matrixMode;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height*0.015,),
            Text(matrixMode == matrixModes.operations ? 'Two Matrix Operations' : 'One Matrix Operations'),
            SizedBox(height: height*0.015,),
            DropdownButton<String>(
              items: matrixModesList.map((String value) {
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
            SizedBox(height: height*0.015,),
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
            SizedBox(height: height*0.015,),
            matrixMode == matrixModes.operations ?
              Row(
                children: [
                  Spacer(flex: 1,),
                  buildChip('Matrix1'),
                  Spacer(flex: 2,),
                  buildChip('Matrix2'),
                  Spacer(flex: 1,),
                ],
              ) :
              buildChip('Matrix1'),
            SizedBox(height: height*0.015,),
            matrixMode == matrixModes.operations ? Form(
              key: _formKey1,
              child: Row(
                children: [
                  sizedBoxWidth,
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextFormFieldMatrix(matrixController: matrix1Controller)),
                  sizedBoxWidth,
                  Flexible(
                    fit: FlexFit.loose,
                    child: TextFormFieldMatrix(matrixController: matrix2Controller)),
                  sizedBoxWidth,
                ]
              ),
            ) : Form(
              key: _formKey1,
              child: Flexible(
                fit: FlexFit.loose,
                child: TextFormFieldMatrix(matrixController: matrix1Controller)
              ),
            ),
            SizedBox(height: height*0.015,),
            
            RaisedButton(
              shape: const StadiumBorder(),
              child: const Text('Result'),
              onPressed: (){
                _formKey1.currentState.save();

                var newList1 = matrixFormObject.fieldToList(matrix1Controller.text);
                
                var dimension = matrixDimension.split('*');

                print(newList1);
                if(matrixMode == matrixModes.operations){
                  var newList2 = matrixFormObject.fieldToList(matrix2Controller.text);
                  print(newList2);
                  setState(() {
                    result = matrixFormObject.calculateOperations(inputMode, newList1, newList2, int.parse(dimension[0]), int.parse(dimension[1]));
                  });
                }
                else{
                  setState(() {
                    result = matrixFormObject.calculateTransform(inputMode, newList1, int.parse(dimension[0]), int.parse(dimension[1]));
                  });
                }
              },
            ),
            SizedBox(height: height*0.015,),
            Text(result == null ? '' : result.toString(), style: TextStyle(fontSize: 15),),
            SizedBox(height: height*0.015,),
          ],
        ),
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
      cursorRadius: const Radius.circular(2),
      cursorWidth: 2,
      decoration: const InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: const BorderSide(
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
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
      key: ValueKey(_text),
      onSaved: (text){
        subMatrix.add(text);
      },
      style: const TextStyle(
        color: Colors.black
      ),
    ),
  );
}
