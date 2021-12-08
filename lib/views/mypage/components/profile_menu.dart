import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextButton(
          onPressed: press,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: kActiveColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              ],
            ),
          )),
    );
  }
}
