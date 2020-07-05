import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scicalc/calc_constants.dart';
import 'package:scicalc/model/calc.dart';

List l = [kEqualSign, kClearSign, kDelSign];
class KeyboardButton extends StatelessWidget {
  final String button;
  KeyboardButton({this.button});
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            if(!l.contains(button)){
              exp += button;
              inputExpression.read(context).state = exp;
            }
            else{
              evaluate(context, exp, button);
            }
            print(exp);
          },
        ),
    );
  }
}