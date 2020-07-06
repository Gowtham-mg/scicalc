import 'package:flutter/material.dart';
import 'package:scicalc/screens/calc_home_page.dart';
import 'modes_of_calc.dart';
import 'matrix_screen.dart';


class BackGround extends StatelessWidget {
  final Widget _child;
  BackGround(this._child);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: _child
          ),
          Container(child: Modes(),)
        ]
      ),
    );
  }
}