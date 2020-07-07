import '../../widgets/bmi_bottom_button.dart';
import 'package:flutter/material.dart';
import '../../calc_constants.dart';
import '../../widgets/bmi_reusable_cards.dart';

class ResultsPage extends StatelessWidget{
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child:Text('Your Result',style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableBMICard(
              colour: kWhiteColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kresultTextStyle,),
                  Text(bmiResult,style: kBmiTextStyle,),
                  Text(interpretation,style: kBodyTextStyle,textAlign: TextAlign.center,),
                BottomButton(buttonTitle: 'RE-CALCULATE', onTap: (){Navigator.pop(context);}, colour: Colors.white70,)
                ],
              ),
            ),
          )
        ],
      );
  }
}