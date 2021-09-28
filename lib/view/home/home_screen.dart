import 'package:FinDit/view/home/components/categorries.dart';
import 'package:FinDit/view/home/components/video.dart';

import 'package:FinDit/view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Simpson님을 위한 추천 영상",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("영상 속 제품을 알려드려요"),
                ],
              ),
            ),
            Categories(),
            Video(),
            Video(),
            Video()
          ],
        ),
      ),
    );
  }
}
