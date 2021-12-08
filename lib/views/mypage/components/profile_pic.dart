import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/account/accout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key, this.user}) : super(key: key);
  final User? user;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${user!.displayName}님, 안녕하세요!",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      iconSize: 17,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () => Get.to(() => AccountScreen(
                            user: user!,
                          )),
                    )
                  ],
                ),
                Text(
                  user!.email.toString(),
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                ),
                Container()
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
