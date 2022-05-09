import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/icon_content.dart';
import 'package:flutter_application_2/result_page.dart';
import 'package:flutter_application_2/reusable_card.dart';
import 'package:flutter_application_2/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }
const kActiveColor = Color(0xFF1D1E33);
const kInactiveColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int height = 180;
  int age = 20;
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: (selectedGender == Gender.male)
                        ? kActiveColor
                        : kInactiveColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: (selectedGender == Gender.female)
                        ? kActiveColor
                        : kInactiveColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF1D1E33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(0xFF1D1E33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
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
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);

              String result = 'Normal';
              String interpretation = 'You have a normal body weight.';
              if (bmi >= 25) {
                result = 'Overweight';
                interpretation = 'You have a higher than normal body weight.';
              } else if (bmi <= 18.5) {
                result = 'Underweight';
                interpretation = 'You have a lower than normal body weight.';
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmi.toStringAsFixed(2),
                    interpretation: interpretation,
                    resultText: result,
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 80,
              color: Color(0xFFEB1555),
            ),
          )
        ],
      ),
    );
  }
}
