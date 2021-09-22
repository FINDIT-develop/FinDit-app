import 'package:flutter/material.dart';
import 'package:moic/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: Column(children: [
        Container(
            padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  "FINDIT",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: kActiveColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: '이메일 입력',
                      hintStyle: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.grey),
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
                        hintStyle: TextStyle(
                            fontFamily: 'Montserrat', color: Colors.grey),
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
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            )),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Text(
                '회원가입',
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
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("핀딧에서 더 많은 혜택을 누리세요! "),
        //     InkWell(
        //       onTap: () {},
        //       child: Text(
        //         '회원가입',
        //         style: TextStyle(
        //           color: kTextColor,
        //           fontSize: 14,
        //           fontFamily: 'Montserrat',
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }
}
