import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../widgets/bottom_button.dart';
import '../widgets/round_icon_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

enum Gender { male, female }
enum Method { minus, plus }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  late Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 50;
  int age = 20;

  void onTapCard(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void onWeightPressed(Method method) {
    if (method == Method.plus) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  void onAgePressed(Method method) {
    if (method == Method.plus) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }

  void onBottomButtonPressed(int height, int weight) {
    CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          bmiResult: calc.calculatorBMI(),
          resultText: calc.getResult(),
          interpretation: calc.getInterpretation(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      onTapCard(Gender.male);
                    },
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      onTapCard(Gender.female);
                    },
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: kInactiveTrackColor,
                          activeTrackColor: Colors.white,
                          thumbColor: kThumbColor,
                          overlayColor: kOverlayColor,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                onPress: () {
                  print('test');
                },
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  onWeightPressed(Method.minus);
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  onWeightPressed(Method.plus);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      onPress: () {
                        print('Haii');
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    onAgePressed(Method.minus);
                                  }),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    onAgePressed(Method.plus);
                                  })
                            ],
                          )
                        ],
                      ),
                      onPress: () {
                        print('Haii');
                      }),
                )
              ],
            )),
            BottomButton(
              onPressed: () {
                onBottomButtonPressed(height, weight);
              },
              buttonTitle: 'CALCULATE',
            )
          ],
        ));
  }
}
