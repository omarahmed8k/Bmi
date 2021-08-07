import 'package:flutter/material.dart';
import '../constants.dart';

class PrimButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  PrimButton({@required this.buttonText, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          buttonText,
          style: TextStyle(
              color: Color(0xFFFFFFFFF),
              fontSize: 25.0,
              fontWeight: FontWeight.w900),
        ),
        onPressed: onPress,
      ),
      color: kThirdColor,
      margin: EdgeInsets.only(top: 10.0),
      height: kButtonHeight,
    );
  }
}
