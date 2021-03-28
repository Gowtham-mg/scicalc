import 'package:flutter/material.dart';
import '../../bmi_constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: deviceHeight * 0.15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: deviceHeight * 0.03,
              color: Color(0xFF8D8E98),
            ),
          ),
        )
      ],
    );
  }
}
