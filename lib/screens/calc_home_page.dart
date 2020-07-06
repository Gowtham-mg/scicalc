import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scicalc/calc_constants.dart';
import 'background.dart';
import '../widgets/keyboard_row.dart';
import '../helper/calc_helper.dart';
import 'modes_of_calc.dart';


class CalcHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackGround(
      Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Consumer(
              (context, read){
              final exp = read(inputExpression).state.toString();
              return SelectableText(
                exp,
                autofocus: true,
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2
                ),
              );
              } 
            )),
            Consumer((context, read){
              final keyBoardType = read(keyboardType).state;
              return Expanded(
              flex: keyBoardType? 4 : 3,
              child: Container(
                // height: MediaQuery.of(context).size.height*0.60,
                child:keyBoardType? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildKeyboardScientificCalculator(),
                  ),
                ) : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: buildKeyboardSingleCalculator(),
                  )
                ),
              );
            }
          )
        ],)
      ),
    );
  }

  List buildKeyboardSingleCalculator() => keyboardSingleCalculator.map((signs) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: KeyboardRows(
                            rowsButtons: signs
                          ),
                        );
                      }).toList();

  List buildKeyboardScientificCalculator() => keyboardScientificCalculator.map((signs) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: KeyboardRows(
                            rowsButtons: signs
                          ),
                        );
                      }).toList();
}

