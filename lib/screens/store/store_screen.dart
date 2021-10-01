import 'package:FinDit/screens/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'package:FinDit/screens/store/components/body.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
