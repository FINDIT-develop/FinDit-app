import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/root.dart';
import 'package:FinDit/screens/account/pages/push_setting.dart';
import 'package:FinDit/screens/mypage/components/profile_menu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app.dart';
import 'pages/edit_profile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "내 계정 관리",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Padding(
              //     padding: const EdgeInsets.only(
              //         left: 21.0, right: 20, top: 20, bottom: 10),
              //     child: Text(
              //       "Account",
              //       style: TextStyle(
              //           fontFamily: "Montserrat",
              //           fontWeight: FontWeight.bold,
              //           fontSize: 19,
              //           color: kActiveColor),
              //     )),
              ProfileMenu(
                  text: "회원 정보 수정",
                  press: () => Get.to(() => EditProfile(user: user!))),
              ProfileMenu(
                  text: "알림 설정", press: () => Get.to(() => PushSetting())),
              ProfileMenu(
                text: "로그아웃",
                press: () async {
                  await FirebaseAuth.instance.signOut();
                  await Get.offAll(() => App());
                },
              ),
            ],
          ),
        ));
  }
}
