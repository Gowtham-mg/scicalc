import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'temperature_calc.dart';

import 'distance_calc.dart';
import '../calc_constants.dart';
import 'speed_calc.dart';
import 'background_constant.dart';
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
          iconName: 'Matrix', 
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child : MatrixScreen(), color: kWhiteColor,)));
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
          iconName: 'Speed',
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: DistanceCalc('speed_calc', 'mph', 'kph'),) ));
          },
        ),

        GridItem(
          icon: Icons.cloud, 
          iconName: 'Temperature',
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: DistanceCalc('temperature_calc', '°C', 'K'),) ));
          },
        ),
        
        GridItem(
          icon: Icons.directions_bike, 
          iconName: 'Distance',
          screen: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(child: DistanceCalc('distance_calc', 'cm', 'km'))));
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
            SizedBox(height: 10,),
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(height: 10,),
            Text(iconName, style: TextStyle(fontSize: 20),)
          ],
        ),
    );
  }
}