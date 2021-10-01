import 'package:flutter/material.dart';
import 'package:FinDit/constants/constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Image.asset(
          "assets/icons/findit_logo.png",
          scale: 2,
        ),
        SizedBox(height: 50.0),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: '이메일 입력',
              hintStyle:
                  TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
        ),
        SizedBox(height: 20.0),
        Container(
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "비밀번호 입력",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent))),
            obscureText: true,
          ),
        ),
        SizedBox(height: 40.0),
        Container(
          height: 50.0,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: kPrimaryColor,
            elevation: 3.0,
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  '로그인',
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
        SizedBox(height: 20.0),
      ],
    );
  }
}
