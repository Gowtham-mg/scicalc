import 'package:flutter/material.dart';
import 'package:scicalc/model/bmi_calc.dart';
import 'package:scicalc/screens/bmi_screens/bmi_results_page.dart';
import 'package:scicalc/screens/bmi_screens/bmi_screen.dart';
import 'package:scicalc/screens/calc_home_page.dart';
import 'package:scicalc/screens/conversion_calc_template.dart';
import 'package:scicalc/screens/matrix_screen.dart';

class Routes {
  static const String home = '/home';
  static const String bmiResult = '/bmi_result';
  static const String bmi = '/bmi';
  static const String matrixOperations = '/matrix_operation';
  static const String matrixTransformation = '/matrix_transformation';
  static const String conversionCalc = '/conversion_calc';

  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => CalcHomePage());
      case Routes.bmi:
        return MaterialPageRoute(
            builder: (BuildContext context) => BMIScreen());
      case Routes.matrixOperations:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                MatrixScreen(MatrixModes.operations));
      case Routes.matrixTransformation:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                MatrixScreen(MatrixModes.transformation));
      case Routes.bmiResult:
        return MaterialPageRoute(
            builder: (context) =>
                ResultsPage(bmiResult: settings.arguments as BmiCalc));
      case Routes.conversionCalc:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ConversionCalcBackground(
            calcMode: arguments['calcMode'],
            input1ModeInitialValue: arguments['input1ModeInitialValue'],
            input2ModeInitialValue: arguments['input2ModeInitialValue'],
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => CalcHomePage());
    }
  }
}
