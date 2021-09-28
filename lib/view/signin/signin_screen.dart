import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/view/signin/components/signinform.dart';
import 'package:FinDit/view/signup/signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

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
        child: Column(children: [
          SignInForm(),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Text(
                  '이메일 찾기',
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Text("|"),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {},
                child: Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Text("|"),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () => Get.to(SignUpScreen()),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
