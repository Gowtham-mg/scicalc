import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calc_constants.dart';
import 'screens/calc_home_page.dart';


void main() {
  runApp(ProviderScope(child: SciCalc()));
}

class SciCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppBarTitleConstant,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalcHomePage(),
    );
  }
}
