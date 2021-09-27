import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/screens/signin/signin_screen.dart';

import '../../constants.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: kPrimaryColor,
                elevation: 3.0,
                child: GestureDetector(
                  onTap: () => Get.to(
                    SignInScreen(),
                  ),
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
      ),
    );
  }
}
