import 'package:flutter/material.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  CardContent({@required this.cardIcon, @required this.cardText});

  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedBoxValue,
        ),
        Text(
          cardText,
          style: kTextStyle,
        ),
      ],
    );
  }
}
