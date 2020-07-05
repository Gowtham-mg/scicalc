import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scicalc/calc_constants.dart';
import 'background.dart';
import '../widgets/keyboard_row.dart';
import '../model/calc.dart';



class CalcHomePage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return BackGround(
      Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(child: Consumer(
              (context, read){
              final exp = read(inputExpression).state.toString();
              return SelectableText(
                exp,
                autofocus: true,
              );
              } 
            )),
            Expanded(child: Consumer(
              (context, read){
              final resultText = read(result).state.toString();
              return SelectableText(
                resultText,
              );
              } 
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: keyboardSingleCalculator.map((signs) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: KeyboardRows(
                    rowsButtons: signs
                  ),
                );
              }).toList(),
            ),
          ],
        )
      ),
    );
  }
}

