import 'package:flutter/material.dart';
import '../../bmi_constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: MediaQuery.of(context).size.height*0.15,
        ),
        sizedBoxHeight,
        Text(label,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03, color: Color(0xFF8D8E98))
        )
      ],
    );
  }
}
