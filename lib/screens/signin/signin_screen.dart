import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/screens/signin/components/signinform.dart';
import 'package:FinDit/screens/signup/signup_screen.dart';

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
        child: Stack(
          children: [
            Column(children: [
              SignInForm(),
              //SizedBox(height: 10.0),
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
                    onTap: () => Get.to(() => SignUpScreen()),
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
              SizedBox(height: 100),
            ]),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 50.0,
            //     child: Material(
            //       borderRadius: BorderRadius.circular(10.0),
            //       color: Colors.blueAccent,
            //       elevation: 0.0,
            //       child: GestureDetector(
            //         onTap: () => Get.to(() => SignUpScreen()),
            //         child: Center(
            //           child: Text(
            //             '회원가입하고 핀딧 즐기기 ',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
