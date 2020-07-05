import 'package:flutter/material.dart';
import 'keyboard_button.dart';

class KeyboardRows extends StatelessWidget {
  KeyboardRows({@required this.rowsButtons});

  final List<String> rowsButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttonsFunc(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  List<Widget> buttonsFunc() {
    List<Widget> buttons = [];
    rowsButtons.forEach((String buttonText) {
      buttons.add(
        KeyboardButton(
          button: buttonText
        ),
      );
    });
    return buttons;
  }
}
