import 'package:flutter/material.dart';

class MatrixForm{
  List fieldsToList(){
    var input;
    List<double> subMatrix = [];
    matrixfields.forEach((key, value) {
      input = double.tryParse(value[1].text);
      input != null ? subMatrix.add(input) : subMatrix.add(0);
    });
    return subMatrix;
  }

  Map matrixfields ={
    0: ['m1n1',TextEditingController()],
    1: ['m1n2',TextEditingController()],
    2: ['m1n3',TextEditingController()],
    3: ['m1n4',TextEditingController()],
    4: ['m2n1',TextEditingController()],
    5: ['m2n2',TextEditingController()],
    6: ['m2n3',TextEditingController()],
    7: ['m2n4',TextEditingController()],
    8: ['m3n1',TextEditingController()],
    9: ['m3n2',TextEditingController()],
    10: ['m3n3',TextEditingController()],
    11: ['m3n4',TextEditingController()],
    12: ['m4n1',TextEditingController()],
    13: ['m4n2',TextEditingController()],
    14: ['m4n3',TextEditingController()],
    15: ['m4n4',TextEditingController()]
  };
}
