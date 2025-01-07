import 'package:flutter/material.dart';
import 'package:flutter_application_6/components/bottom_button.dart';
import 'package:flutter_application_6/constants.dart';
import 'package:flutter_application_6/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({ required this.interpretation, required this.bmiResult, required this.resultText });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          // 1
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: Constants.kTitleTextStyle,
              ),
            ),
          ),

          // 2
          Expanded(
            flex: 5,
            child: ReusableCard(
              tColor: Constants.kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 1
                  Text(
                    resultText.toUpperCase(),
                    style: Constants.kResultTextStyle,
                  ),

                  // 2
                  Text(
                    bmiResult,
                    style: Constants.kBMITextStyle,
                  ),

                  // 3
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: Constants.kBodyTextStyle,
                  )

                ],
              ),
            ),
          ),

          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}
