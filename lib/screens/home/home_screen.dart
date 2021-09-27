import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
