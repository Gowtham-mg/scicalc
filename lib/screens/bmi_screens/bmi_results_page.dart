import 'package:flutter/material.dart';
import 'package:scicalc/model/bmi_calc.dart';
import 'package:scicalc/screens/background_template.dart';

import '../../widgets/bmi_widgets/bmi_bottom_button.dart';
import '../../bmi_constants.dart';
import '../../widgets/bmi_widgets/bmi_reusable_cards.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult});
  final BmiCalc bmiResult;

  @override
  Widget build(BuildContext context) {
    return BackGround(
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Color(0xFF8D8E98),
                ),
              ),
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
                  Text(
                    bmiResult.getResult().toUpperCase(),
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResult.calculationBMI(),
                    style: kBmiTextStyle,
                  ),
                  Text(
                    bmiResult.getInterpretation(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  BottomButton(
                    buttonTitle: 'RE-CALCULATE',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    colour: Colors.white70,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
