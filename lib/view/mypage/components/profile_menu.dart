import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    String this.text,
    String this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: kTextColor,
            //padding: EdgeInsets.all(20),
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(fontSize: 17),
          )),
    );
  }
}
