import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:bmi_calculator/resultpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => InputPage(), '/first': (context) => result()},
      theme: ThemeData(
        //primarySwatch: Colors.red,
        colorScheme: ColorScheme(
            primary: Color(0xFF090C22),
            background: Colors.red,
            brightness: Brightness.light,
            onBackground: Colors.red,
            onPrimary: Colors.white70,
            onSecondary: Colors.white70,
            error: Colors.blue,
            onError: Colors.blue,
            onSurface: Colors.blueGrey,
            secondary: Colors.purple,
            tertiary: Colors.red,
            surface: Colors.yellow),

        //accentColor: Color(0xFF987654),
        //primaryColor: Color(0xFFFFFFFF),
        //backgroundColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
        //textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xFFFFFFFF)))
      ),
      //home: InputPage(),
    );
  }
}
