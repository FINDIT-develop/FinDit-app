import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/home/components/banner.dart';
import 'package:FinDit/screens/home/components/categories.dart';
import 'package:FinDit/screens/home/components/thumbnail.dart';
import 'package:FinDit/screens/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "정연님을 위한 추천 영상",
                    style: TextStyle(
                      fontSize: 19,
                      color: kActiveColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Text("영상 속 제품을 알려드려요"),
                ],
              ),
            ),
            Categories(),
            Thumbnail()
          ],
        ),
      ),
    );
  }
}
