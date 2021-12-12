import 'package:FinDit/views/like/components/liked_product.dart';
import 'package:FinDit/views/like/components/liked_video.dart';
import 'package:flutter/material.dart';

import 'package:FinDit/views/constants/constants.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 45,
            title: Text(
              "좋아요",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            bottom: TabBar(
                indicatorWeight: 1.5,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: kActiveColor,
                ),
                indicatorColor: kActiveColor,
                tabs: [
                  Tab(
                    text: "영상",
                  ),
                  Tab(
                    text: "제품",
                  )
                ]),
          ),
          body: TabBarView(children: <Widget>[LikeVideo(), LikeProduct()])),
    );
  }
}
