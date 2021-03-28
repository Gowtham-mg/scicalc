import 'package:flutter/material.dart';
import 'keyboard_button.dart';

class KeyboardRows extends StatelessWidget {
  KeyboardRows({@required this.rowsButtons});

  final List<String> rowsButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowsButtons
          .map((String buttonText) => KeyboardButton(button: buttonText))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
