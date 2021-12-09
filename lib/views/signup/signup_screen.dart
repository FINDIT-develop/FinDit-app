import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'components/signupform.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: SignUpForm()),
        ));
  }
}
