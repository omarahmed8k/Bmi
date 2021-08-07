import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../components/reCard.dart';
import '../components/primButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0, 0),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ReCard(
              cardColor: kInActiveColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),
          PrimButton(
            buttonText: 'Reset',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
