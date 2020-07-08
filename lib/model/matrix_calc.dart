import 'package:flutter/material.dart';

class MatrixForm{
  // Map<String, double> matrixfields;
  // List subList = [];
  //   matrixfields.map((key, value) {
  //     if((key+1)%4 == 0){
  //       List tempList = subList;
  //       subList.clear();
  //       return MapEntry<int,dynamic>(key,tempList).value.toList();
  //     }else{
  //       subList.add(value);
  //     }
  //   });
  fieldsToList()=>[
    [matrixfields[0][1].text, matrixfields[1][1].text, matrixfields[2][1].text, matrixfields[3][1].text,], 
    [matrixfields[4][1].text, matrixfields[5][1].text, matrixfields[6][1].text, matrixfields[7][1].text,], 
    [matrixfields[8][1].text, matrixfields[9][1].text, matrixfields[10][1].text, matrixfields[11][1].text,],
    [matrixfields[12][1].text, matrixfields[13][1].text, matrixfields[14][1].text, matrixfields[15][1].text,]
  ];
  

  // MatrixForm(this.matrixfields);

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
