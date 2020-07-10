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
        title: const Text(kAppBarTitleConstant),
        centerTitle: true,
      ),
      body: PageView(
        onPageChanged: (index){
          print('pageviewindex $index');
        },
        children:[
          Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: child
          ),
          Container(child: Modes(),)
        ]
      ),
    );
  }
}