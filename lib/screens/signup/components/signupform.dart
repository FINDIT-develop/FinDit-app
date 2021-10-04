import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/constants/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key ?key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  void getWeatherData() async {
    try {
      var dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:3000/app/"));

      var response = await dio.get('/test');

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print("Error!");
      }
    } catch (e) {
      print(e);
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // build 될 때 실행
    getWeatherData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "회원가입",
          style: TextStyle(
            //fontFamily: 'Montserrat',
            color: kActiveColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.italic
          ),
        ),
        SizedBox(height: 40.0),
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
        TextField(
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
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "비밀번호 확인",
              hintStyle:
                  TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "이름 입력",
              hintStyle:
                  TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "휴대폰 번호 입력",
              hintStyle:
                  TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
          obscureText: true,
        ),
        SizedBox(height: 30.0),
        Container(
          height: 30,
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              Text("전체동의")
            ],
          ),
        ),
        Divider(),
        Container(
          height: 30,
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              Text("이용약관에 동의합니다.")
            ],
          ),
        ),
        Container(
          height: 30,
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              Text("개인정보 수집 및 이용에 동의합니다.")
            ],
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
                  '회원가입',
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
    );
  }
}
