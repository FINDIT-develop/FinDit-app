import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/signin/signin_screen.dart';
import 'package:FinDit/screens/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoProfile extends StatelessWidget {
  const NoProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () => Get.to(() => SignInScreen()),
                  child: Row(
                    children: [
                      Text(
                        "로그인 / 회원가입 ",
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "로그인 후 핀딧을 즐겨보세요 :)",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // PrimaryButton(
          //     onTap: () =>
          //         Get.to(() => SignInScreen(), transition: Transition.downToUp),
          //     text: "로그인 / 회원가입")
        ],
      ),
    );
  }
}
