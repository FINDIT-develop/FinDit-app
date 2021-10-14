import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/app.dart';
import 'package:FinDit/screens/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

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
          ProfilePic(),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 10,
            color: Colors.grey[200],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ProfileMenu(
                    text: "공지사항",
                    press: () {},
                  ),
                  Divider(),
                  ProfileMenu(
                    text: "FAQ",
                    press: () {},
                  ),
                  Divider(),
                  ProfileMenu(
                    text: "개인정보 수집 및 이용",
                    press: () {},
                  ),
                  Divider(),
                  ProfileMenu(
                    text: "서비스 이용 약관",
                    press: () {},
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
