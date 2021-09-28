import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/constants.dart';

import 'components/signupform.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(children: [
            SignUpForm(),
          ]),
        ));
  }
}
