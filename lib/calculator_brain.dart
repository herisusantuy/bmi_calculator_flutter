import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;
  late double _bmi;

  String calculatorBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() => _bmi >= 25
      ? 'Overweight'
      : _bmi >= 18.5
          ? 'Normal'
          : 'Underweight';

  String getInterpretation() => _bmi >= 25
      ? 'You have a higher than normal body weight. Try to exercise more.'
      : _bmi >= 18.5
          ? 'You have a normal body weight. Good job.'
          : 'You have a lower than normal body weight. You can eat a bit more.';
}
