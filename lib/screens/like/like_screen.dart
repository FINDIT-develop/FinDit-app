import 'package:FinDit/screens/like/components/like_categry.dart';
import 'package:FinDit/screens/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:FinDit/constants/constants.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool islogedin = false;
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(slivers: [
      SliverAppBar(
        title: AppBar(
          title: Text(
            "좋아요",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        floating: true,
        snap: false,
        titleSpacing: 0,
      ),
      SliverAppBar(
        title: LikeCategory(),
        floating: true,
        snap: false,
        pinned: true,
        titleSpacing: 0,
      ),
      // Padding(
      //   padding: const EdgeInsets.all(kDefaultPadding),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Center(child: LikeCategory()),
      //       Expanded(child: Column())
      //     ],
      //   ),
      // ),
    ])));
  }
}
