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
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: LikeCategory()),
              Expanded(child: Column())
            ],
          ),
        ),
      ),
    );
  }
}
