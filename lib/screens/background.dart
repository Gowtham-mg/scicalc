import 'package:flutter/material.dart';
import 'package:scicalc/screens/calc_home_page.dart';
import 'modes_of_calc.dart';
import 'matrix_screen.dart';


class BackGround extends StatelessWidget {
  final Widget child;
  final color;
  BackGround({this.child, this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade200,
        title: Text('SciCalc'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              
            },
          )
        ],
      ),
      body: PageView(
        onPageChanged: (index){
          print(index);
        },
        children:[
          Container(
            child: child
          ),
          Container(child: Modes(),)
        ]
      ),
    );
  }
}