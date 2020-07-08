import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../calc_constants.dart';
import '../helper/calc_helper.dart';
import '../screens/modes_of_calc.dart';


class KeyboardButton extends StatelessWidget {
  final String button;
  KeyboardButton({this.button});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MaterialButton(
          shape: CircleBorder(),
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              button,
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0),
            ),
          ),
          onPressed: () {
            var exp = inputExpression.read(context).state;
            if(evalSpecialCharacters.contains(button) || button == '+/-'){
              evaluate(context, exp, button);
            }else if(arithmetic.contains(button)){
              exp += ' '+ button +' ';
              inputExpression.read(context).state = exp;
            }else{
              print(button);
              exp += button;
              inputExpression.read(context).state = exp;            
            }
            print(exp);
            print(keyboardType.read(context).state);
          },
        ),
    );
  }
}