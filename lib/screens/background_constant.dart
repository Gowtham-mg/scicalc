import 'package:flutter/material.dart';
import 'package:scicalc/calc_constants.dart';

import 'modes_of_calc.dart';


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
        title: Text(kAppBarTitleConstant),
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