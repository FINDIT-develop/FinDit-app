import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "정연님, 안녕하세요!",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Text(
                  "yeonns2@gmail.com",
                  style: TextStyle(fontSize: 16),
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
