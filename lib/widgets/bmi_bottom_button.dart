import 'package:flutter/material.dart';
import '../calc_constants.dart';

class BottomButton extends StatelessWidget{

  BottomButton({@required this.onTap,@required this.buttonTitle, this.colour = kWhiteColor});

  final Function onTap;
  final String buttonTitle;
  final Color colour;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: colour,
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Center(
          child: Text(buttonTitle,
            style: kLargeButtonTextStyle,),
        ),
      ),
    );
  }
}