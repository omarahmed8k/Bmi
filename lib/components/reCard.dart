import 'package:flutter/material.dart';

class ReCard extends StatelessWidget {
  ReCard({@required this.cardColor, this.cardChild, this.onPress});

  final Color cardColor;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardColor,
        ),
      ),
    );
  }
}
