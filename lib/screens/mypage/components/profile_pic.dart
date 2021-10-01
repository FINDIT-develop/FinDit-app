import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 230,
      child: Column(
        children: [
          SizedBox(height: 70),
          Text(
            "나만의 옷을 찾고 싶다면, \n지금 로그인 해보세요!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 40),
          Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: kPrimaryColor,
              elevation: 3.0,
              child: GestureDetector(
                onTap: () => Get.to(() => SignInScreen(),
                    transition: Transition.downToUp),
                child: Center(
                  child: Text(
                    '로그인하러가기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
