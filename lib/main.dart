import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scicalc/routes.dart';
import 'calc_constants.dart';


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
      onGenerateRoute: Routes.routeGenerator,
      initialRoute: Routes.home,
    );
  }
}
