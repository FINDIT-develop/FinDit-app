import 'package:FinDit/view/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
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
                      text: "개인정보처리방침",
                      press: () {},
                    ),
                    Divider(),
                    ProfileMenu(
                      text: "서비스 이용약관",
                      press: () {},
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
