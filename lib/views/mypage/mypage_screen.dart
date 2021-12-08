import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/app.dart';
import 'package:FinDit/views/mypage/components/no_profile.dart';
import 'package:FinDit/views/mypage/components/profile_pic.dart';
import 'package:FinDit/views/mypage/pages/inquire.dart';
import 'package:FinDit/views/mypage/pages/notice.dart';
import 'package:FinDit/views/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "마이페이지",
        //     style: TextStyle(
        //         color: kPrimaryColor,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 17),
        //   ),
        // ),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: user == null ? false : true,
            replacement: NoProfile(),
            child: ProfilePic(
              user: user,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 20, top: 20, bottom: 10),
                      child: Text(
                        "setting",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: kActiveColor),
                      )),
                  ProfileMenu(
                      text: "공지사항", press: () => Get.to(() => NoticeScreen())),
                  ProfileMenu(
                      text: "1:1 문의",
                      press: () => Get.to(() => InquireScreen())),
                  ProfileMenu(
                    text: "개인정보 처리 방침",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "서비스 이용 약관",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "버전정보  1.0.0",
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
