import 'package:flutter/material.dart';

class MatrixForm{
  // Map<String, double> formInput;

  // List toList()=>[
  //   [formInput['m1n1'], formInput['m1n2'], formInput['m1n3'], formInput['m1n4'],], 
  //   [formInput['m2n1'], formInput['m2n2'], formInput['m2n3'], formInput['m2n4'],], 
  //   [formInput['m3n1'], formInput['m3n2'], formInput['m3n3'], formInput['m3n4'],],
  //   [formInput['m4n1'], formInput['m4n2'], formInput['m4n3'], formInput['m4n4'],]
  // ];

  // MatrixForm(this.formInput);

  Map matrixfields ={
    '0': ['m1n1',TextEditingController()],
    '1': ['m1n2',TextEditingController()],
    '2': ['m1n3',TextEditingController()],
    '3': ['m1n4',TextEditingController()],
    '4': ['m2n1',TextEditingController()],
    '5': ['m2n2',TextEditingController()],
    '6': ['m2n3',TextEditingController()],
    '7': ['m2n4',TextEditingController()],
    '8': ['m3n1',TextEditingController()],
    '9': ['m3n2',TextEditingController()],
    '10': ['m3n3',TextEditingController()],
    '11': ['m3n4',TextEditingController()],
    '12': ['m4n1',TextEditingController()],
    '13': ['m4n2',TextEditingController()],
    '14': ['m4n3',TextEditingController()],
    '15': ['m4n4',TextEditingController()]
  };
}
