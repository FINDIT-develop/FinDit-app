import 'package:FinDit/views/find_password/find_password_screen.dart';
import 'package:FinDit/views/widgets/primary_button.dart';
import 'package:FinDit/views/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/signin/components/signinform.dart';
import 'package:FinDit/views/signup/signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Get.back(),
          ),
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Stack(
          children: [
            Column(children: [
              SignInForm(),
              SizedBox(height: 10.0),
              SecondaryButton(
                  onTap: () => Get.to(() => SignUpScreen()), text: "이메일로 회원가입"),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.to(() => FindPasswordScreen()),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '비밀번호를 잊어버리셨나요?',
                      style: TextStyle(
                        color: kTextColor,
                        //fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ]),
          ],
        ),
      ),
    );
  }
}
