import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primaryColorDark: kPrimaryColor),
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: const InputPage(),
    );
  }
}
