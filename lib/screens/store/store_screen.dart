import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:FinDit/screens/store/components/body.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "스토어",
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Body(),
    );
  }
}
