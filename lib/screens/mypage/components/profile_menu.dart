import 'package:flutter/material.dart';


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
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: GestureDetector(
          onTap: press,
          child: Text(
            text,
            style: TextStyle(fontSize: 17),
          )),
    );
  }
}
