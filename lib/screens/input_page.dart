import 'package:bmi_calculator/calculateBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reCard.dart';
import '../components/cardContent.dart';
import '../constants.dart';
import '../components/primButton.dart';
import '../components/roundButton.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 150;
  int userWeight = 70;
  int userAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.mars, cardText: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColor: selectedGender == Gender.female
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.venus, cardText: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReCard(
              cardColor: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    textAlign: TextAlign.center,
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        userHeight.toString(),
                        style: kCardText,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: kThirdColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 0.0,
                      max: 200.0,
                      onChanged: (double value) {
                        setState(() {
                          userHeight = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReCard(
                    cardColor: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          userWeight.round().toString(),
                          style: kCardText,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  userWeight > 0
                                      ? userWeight--
                                      : userWeight = 0;
                                  print(userWeight);
                                });
                              },
                            ),
                            SizedBox(width: 50.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  userWeight++;
                                  print(userWeight);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReCard(
                    cardColor: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          userAge.round().toString(),
                          style: kCardText,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userAge > 0 ? userAge-- : userAge = 0;
                                  print(userAge);
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 50.0),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userAge++;
                                  print(userAge);
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PrimButton(
            buttonText: 'Calculate',
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: userHeight, weight: userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
