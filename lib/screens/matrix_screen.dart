import 'package:flutter/material.dart';
import 'package:scicalc/screens/background_template.dart';
import '../calc_constants.dart';
import '../bmi_constants.dart';
import '../model/matrix_calc.dart';

enum MatrixModes { operations, transformation }
List subMatrix = List();

class MatrixScreen extends StatefulWidget {
  final MatrixModes matrixMode;
  MatrixScreen(this.matrixMode);
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  final _formKey1 = GlobalKey<FormState>(debugLabel: 'Matrix1');

  final matrixFormObject = MatrixForm();

  final matrix1Controller = TextEditingController();

  final matrix2Controller = TextEditingController();

  String inputMode = '';

  String matrixDimension = '4*4';

  var result;

  bool matrixChosen = true;

  List<String> matrixModesList = [''];

  @override
  void initState() {
    inputMode = widget.matrixMode == MatrixModes.operations
        ? kMatrixAddition
        : kMatrixTranspose;
    matrixModesList = widget.matrixMode == MatrixModes.operations
        ? kTwoMatrixOperations
        : kSingleMatrixOperations;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.matrixMode == MatrixModes.operations) {
      matrix1Controller.clear();
      matrix2Controller.clear();
    } else {
      matrix1Controller.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final matrixMode = widget.matrixMode;
    return BackGround(
      color: kWhiteColor,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: height -
              MediaQuery.of(context).viewPadding.vertical -
              AppBar().preferredSize.height,
          child: Column(
            children: [
              Spacer(flex: 1),
              Text(
                matrixMode == MatrixModes.operations
                    ? 'Two Matrix Operations'
                    : 'One Matrix Operations',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Please Enter each element of matrix comma separated with appropriate dimensions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Spacer(flex: 1),
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
              Spacer(flex: 1),
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
              Spacer(flex: 1),
              matrixMode == MatrixModes.operations
                  ? Row(
                      children: [
                        Spacer(flex: 1),
                        Chip(label: Text('Matrix1')),
                        Spacer(flex: 2),
                        Chip(label: Text('Matrix2')),
                        Spacer(flex: 1),
                      ],
                    )
                  : Chip(label: Text('Matrix1')),
              Spacer(flex: 1),
              matrixMode == MatrixModes.operations
                  ? Form(
                      key: _formKey1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextFormFieldMatrix(
                                  matrixController: matrix1Controller),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextFormFieldMatrix(
                                  matrixController: matrix2Controller),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Form(
                      key: _formKey1,
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: TextFormFieldMatrix(
                            matrixController: matrix1Controller),
                      ),
                    ),
              Spacer(flex: 1),
              RaisedButton(
                shape: const StadiumBorder(),
                child: const Text('Result'),
                onPressed: () {
                  var dimension = matrixDimension.split('*');
                  _formKey1.currentState.save();

                  var newList1 =
                      matrixFormObject.fieldToList(matrix1Controller.text);
                  print(newList1);
                  if (matrixMode == MatrixModes.operations) {
                    var newList2 =
                        matrixFormObject.fieldToList(matrix2Controller.text);
                    if ((newList1.length !=
                            int.parse(dimension[0]) *
                                int.parse(dimension[1])) ||
                        (newList2.length !=
                            int.parse(dimension[0]) *
                                int.parse(dimension[1]))) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                'Number of values entered doesn\'t match the dimension of the matrix. Eg: 2*2 matrix should have 4 values (comma-separated)'),
                          );
                        },
                      );
                    } else {
                      print(newList2);
                      setState(() {
                        result = matrixFormObject.calculateOperations(
                          inputMode,
                          newList1,
                          newList2,
                          int.parse(dimension[0]),
                          int.parse(dimension[1]),
                        );
                      });
                    }
                  } else {
                    print('transp ${matrix1Controller.text.length}');
                    if (newList1.length !=
                        int.parse(dimension[0]) * int.parse(dimension[1])) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                  'Number of values entered doesn\'t match the dimension of the matrix. Eg: 2*2 matrix should have 4 values (comma-separated)'),
                            );
                          });
                    } else {
                      setState(() {
                        result = matrixFormObject.calculateTransform(
                          inputMode,
                          newList1,
                          int.parse(dimension[0]),
                          int.parse(dimension[1]),
                        );
                      });
                    }
                  }
                },
              ),
              Spacer(flex: 1),
              Text(
                result == null ? '' : result.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
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
              color: Colors.black, style: BorderStyle.solid, width: 2),
        )),
        onChanged: (value) {
          print('value1: $value');
        });
  }
}

Widget matrixTextField(
    _index, String _text, TextEditingController _controller) {
  print(_index);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
    child: TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _text,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
      key: ValueKey(_text),
      onSaved: (text) {
        subMatrix.add(text);
      },
      style: const TextStyle(color: Colors.black),
    ),
  );
}
