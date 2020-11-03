import 'package:flutter/material.dart';
import 'constants.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final Function onTap;

  MyButton({this.color, this.textColor, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: kButtonDecoration.copyWith(
              color: color,
              boxShadow: kBoxShadow,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
