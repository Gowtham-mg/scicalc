import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/bmi_calc.dart';
import '../../widgets/bmi_widgets/bmi_reusable_cards.dart';
import '../../widgets/bmi_widgets/bmi_round_icon_button.dart';
import '../../widgets/bmi_widgets/bmi_bottom_button.dart';
import '../../calc_constants.dart';
import '../../widgets/bmi_widgets/bmi_icon_content.dart';
import 'bmi_results_page.dart';
import '../background_constant.dart';


enum Gender{
  male,
  female
}


class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableBMICard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kWhiteColor : kWhiteColor,
                  cardChild: IconContent(icon:FontAwesomeIcons.mars,label: 'MALE',),
                ),
              ),
              Expanded(
                  child: ReusableBMICard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kWhiteColor : kWhiteColor,
                    cardChild: IconContent(icon:FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),
              ),
            ],
          )),
          Expanded(
              child: ReusableBMICard(
                colour: kWhiteColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('HEIGHT',style: klabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: knumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kWhiteColor,
                          activeTrackColor: Color(0xFF8D8E98),
                        thumbColor: Colors.redAccent.shade200,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                        overlayColor: Color(0x29EB1555)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 300.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableBMICard(
                    colour: kWhiteColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberTextStyle ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            sizedBoxWidth,
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: ReusableBMICard(
                    colour: kWhiteColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  age++;
                                });
                              },
                            ),
                            sizedBoxWidth,
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              BmiCalc calc = BmiCalc(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              BackGround(
                child: ResultsPage(
                  bmiResult: calc.calculationBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
                color: kWhiteColor
              )));
            },
          )
        ],
    );
  }
}