import 'package:flutter/material.dart';
import '../../bmi_constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: kWhiteColor,
      constraints: BoxConstraints.tightFor(width: deviceSize.width*0.08,height: deviceSize.width*0.08),
      elevation: 2.0,
      onPressed: onPressed,
    );
  }
}
