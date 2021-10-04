import 'package:FinDit/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:get/get.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    // leading: IconButton(
    //   icon: SvgPicture.asset("assets/icons/back.svg"),
    //   onPressed: () {},
    // ),
    title: Image.asset(
      "assets/icons/findit_logo.png",
      scale: 3,
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          // By default our  icon color is white
          color: kActiveColor,
        ),
        onPressed: () => Get.to(() => SearchScreen()),
      ),
      SizedBox(width: kDefaultPadding / 2)
    ],
  );
}
