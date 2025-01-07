import 'package:flutter/material.dart';
import 'package:flutter_application_6/calculator_brain.dart';
import 'package:flutter_application_6/constants.dart';
import 'results_page.dart';
import 'package:flutter_application_6/components/bottom_button.dart';
import 'package:flutter_application_6/components/first_widget.dart';
import 'package:flutter_application_6/components/second_widget.dart';
import 'package:flutter_application_6/components/reusable_card.dart';
import 'package:flutter_application_6/components/third_widget.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int colorValue = -1;

  int weight = 60;

  int age = 20;

  int heightValue = 180;

  void setColorValue(int tColorValue, int tSelectedValue) {
    setState(() {
      if (this.colorValue == tColorValue || this.colorValue == -1) {
        this.colorValue = tSelectedValue;
      } else {
        print('Same Color Selected $tSelectedValue');
        this.colorValue = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'J-BMI Calculator',
        ),
        backgroundColor: Color(0xEE1D1E33),
        elevation: 3.0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // 1
          Expanded(
            child: Row(
              children: <Widget>[
                // 1-1
                Expanded(
                  child: ReusableCard(
                    tColor: Constants.kActiveCardColor,
                    onClickColor: Constants.kInactiveCardColor,
                    cardChild: FirstWidget(
                      icon: Icons.male,
                      title: "Male",
                      selectedIndex: 1,
                      selectedValue: this.colorValue,
                    ),
                    selectedIndex: 1,
                    colorValue: this.colorValue,
                    onPress: () => setColorValue(2, 1),
                  ),
                ),

                // 1-2
                Expanded(
                  child: ReusableCard(
                    tColor: Constants.kActiveCardColor,
                    onClickColor: Constants.kInactiveCardColor,
                    cardChild: FirstWidget(
                      icon: Icons.female,
                      title: "Female",
                      selectedIndex: 2,
                      selectedValue: this.colorValue,
                    ),
                    selectedIndex: 2,
                    colorValue: this.colorValue,
                    onPress: () => setColorValue(1, 2),
                  ),
                ),
              ],
            ),
          ),

          // 2
          Expanded(
            child: ReusableCard(
              tColor: Constants.kActiveCardColor,
              onClickColor: Constants.kInactiveCardColor,
              cardChild: SecondWidget(
                title: 'HEIGHT',
                heightValue: heightValue,
                onChanged: (double newValue) {
                  setState(() {
                    heightValue = newValue.round();
                  });
                },
              ),
            ),
          ),

          // 3
          Expanded(
            child: Row(
              children: <Widget>[
                // 2-1
                Expanded(
                  child: ReusableCard(
                    tColor: Constants.kActiveCardColor,
                    onClickColor: Constants.kInactiveCardColor,
                    cardChild: ThirdWidget(
                      title: 'WEIGHT',
                      weight: weight,
                      onPlusPressed: () {
                        setState(() {
                          ++weight;
                        });
                      },
                      onMinusCallback: () {
                        if (weight > 1) {
                          setState(() {
                            --weight;
                          });
                        }
                      },
                    ),
                  ),
                ),

                // 2-2
                Expanded(
                  child: ReusableCard(
                    tColor: Constants.kActiveCardColor,
                    onClickColor: Constants.kInactiveCardColor,
                    cardChild: ThirdWidget(
                      title: 'Age',
                      weight: age,
                      onPlusPressed: () {
                        setState(() {
                          ++age;
                        });
                      },
                      onMinusCallback: () {
                        if (age > 1) {
                          setState(() {
                            --age;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 4
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {

              CalculatorBrain calc = new CalculatorBrain(height: heightValue, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
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
