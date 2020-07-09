import 'package:flutter/material.dart';
import 'package:ml_linalg/linalg.dart';
import '../calc_constants.dart';

class MatrixForm{
  
  List fieldToList(String text){
    List<String> input = text.split(',');
    List<double> subMatrix = [];
    var temp;
    input.forEach((element) { 
      temp = double.tryParse(element);
      temp != null ? subMatrix.add(temp) : subMatrix.add(0);
    });
    return subMatrix;
  }

  calculate(String mode, input1, input2, int m, int n){
    var modifiedInput1;
    var modifiedInput2;
    switch(mode){
      case kMatrixAddition: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = Matrix.fromFlattenedList(input2, m, n);
                            return modifiedInput1 + modifiedInput2;
                            break;

      case kMatrixAddScalar: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = double.parse(input2);
                            return modifiedInput1 + modifiedInput2;
                            break;

      case kMatrixMultiplyVector: modifiedInput1 = Matrix.fromList(input1);
                            modifiedInput2 = Vector.fromList(input2);
                            return modifiedInput1 * modifiedInput2;
                            break;

      case kMatrixMultiplication: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = Matrix.fromFlattenedList(input2, n, m);
                            return modifiedInput1 * modifiedInput2;
                            break;

      case kMatrixMultiplyScalar: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = double.parse(input2);
                            return modifiedInput1 * modifiedInput2;
                            break; 
      
      case kElementWiseMultiplication: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = Matrix.fromFlattenedList(input2, m, n);
                            return modifiedInput1.multiply(modifiedInput2);
                            break;

      case kElementWiseSubtraction: modifiedInput1 = Matrix.fromFlattenedList(input1, m, n);
                            modifiedInput2 = Matrix.fromFlattenedList(input2, m, n);
                            return modifiedInput1 - modifiedInput2;
                            break; 
    }
  }
}

      // case kReduceColumnWise: '';break; 

      // case kReduceRowWise: '';break; 

      // case kMatrixSumElements: '';break;

      // case kMatrixProductElements: '';break;

      // case kMatrixMaxValue: '';break;

      // case kMatrixMinValue: '';break;