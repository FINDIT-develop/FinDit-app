import 'package:FinDit/screens/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/screens/signin/signin_screen.dart';

import 'package:FinDit/constants/constants.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
