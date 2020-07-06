import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'background.dart';
import 'matrix_screen.dart';
import 'calc_home_page.dart';

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BackGround(MatrixScreen())));
          },
        ),
        GridItem(
          icon: Icons.accessibility, 
          iconName: 'BMI',
        ),
        GridItem(
          icon: Icons.av_timer, 
          iconName: 'Speed',
        ),
        GridItem(
          icon: Icons.cloud, 
          iconName: 'Temperature',
        ),
        GridItem(
          icon: Icons.directions_bike, 
          iconName: 'Distance',
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