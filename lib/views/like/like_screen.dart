import 'package:FinDit/views/like/components/like_categry.dart';
import 'package:FinDit/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:FinDit/views/constants/constants.dart';

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

      SliverToBoxAdapter(
          child: Center(
        child: Text("마음에 드는 제품은 ♡를 눌러서 저장할 수 있어요:)",
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontFamily: "Montserrat")),
      )),
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
