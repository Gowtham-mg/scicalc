import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scicalc/calc_constants.dart';

import 'conversion_calc_template.dart';
import '../bmi_constants.dart';
import 'background_template.dart';
import 'matrix_screen.dart';
import 'calc_home_page.dart';
import 'bmi_screens/bmi_screen.dart';


final keyboardType = StateProvider((ref)=>false);
class Modes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),   
      children: [
        Consumer((context, read)=> GridItem(
            icon: Icons.settings,
            iconName: read(keyboardType).state ? 'Standard' : 'Advanced',
            screen: (){
              keyboardType.read(context).state = !keyboardType.read(context).state;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalcHomePage()));
            },
          )
        ),

        GridItem(
          icon: Icons.grid_on, 
          iconName: 'Matrix Operations', 
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child : MatrixScreen(matrixModes.operations), color: kWhiteColor,)));
          },
        ),

        GridItem(
          icon: Icons.grid_on, 
          iconName: 'Matrix Transformations', 
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child : MatrixScreen(matrixModes.transformation), color: kWhiteColor,)));
          },
        ),

        GridItem(
          icon: Icons.accessibility, 
          iconName: 'BMI',
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: BMIScreen(), color: Color(0xFFF4F6FD))));
          },
        ),

        GridItem(
          icon: Icons.av_timer, 
          iconName: kSpeedScreenName,
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: ConversionCalcBackground(calcMode: 'speed_calc', input1ModeInitialValue: 'mph', input2ModeInitialValue: 'kph'),) ));
          },
        ),

        GridItem(
          icon: Icons.cloud, 
          iconName: kTemperatureScreenName,
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: ConversionCalcBackground(calcMode: 'temperature_calc', input1ModeInitialValue: '°C', input2ModeInitialValue:'K'),) ));
          },
        ),
        
        GridItem(
          icon: Icons.directions_bike, 
          iconName: kDistanceScreenName,
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: ConversionCalcBackground(calcMode: 'distance_calc', input1ModeInitialValue:'cm', input2ModeInitialValue:'km'))));
          },
        )
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final icon;
  final iconName;
  final screen;
  const GridItem({
    Key key,
    this.icon,
    this.iconName,
    this.screen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: screen,
        child: Column(
          children: [
            sizedBoxHeight,
            Icon(
              icon,
              size: 30,
            ),
            sizedBoxHeight,
            Text(iconName, style: TextStyle(fontSize: 20),maxLines: 2, textAlign: TextAlign.center,),
          ],
        ),
    );
  }
}