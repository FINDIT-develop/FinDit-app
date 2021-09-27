import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/screens/mypage/components/profile_menu.dart';
import 'package:FinDit/screens/mypage/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          //ProfilePic(),
          //ProfileMenu(),
        ],
      ),
    );
  }
}
