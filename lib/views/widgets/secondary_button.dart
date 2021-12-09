import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final onTap;
  final text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          elevation: 2.0,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: kActiveColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),
    );
  }
}
