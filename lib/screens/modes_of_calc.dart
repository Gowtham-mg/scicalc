import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'calc_home_page.dart';

final keyboardType = StateProvider((ref)=>false);
class Modes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
  padding: EdgeInsets.all(20),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  children: [
    GridItem(icon: Icons.settings,iconName: 'Advanced'),
    GridItem(icon: Icons.grid_on, iconName: 'Matrix',),
    GridItem(icon: Icons.accessibility, iconName: 'BMI',),
    GridItem(icon: Icons.av_timer, iconName: 'Speed',),
    GridItem(icon: Icons.cloud, iconName: 'Temperature',),
    GridItem(icon: Icons.directions_bike, iconName: 'Distance',)
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
        onPressed: (){
          keyboardType.read(context).state = !keyboardType.read(context).state;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalcHomePage(0)));
          SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
        },
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