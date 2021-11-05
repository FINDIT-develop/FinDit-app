import 'dart:convert';

import 'package:FinDit/controllers/user_controller.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';

import 'package:flutter/material.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  UserController userController = UserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordcheck = TextEditingController();
  TextEditingController _name = TextEditingController();

  bool isChecked = false;
  // _MyCustomFormState가 생성될 때 호출
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
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
            TextFormField(
              controller: _email,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '이메일을 입력해주세요.';
                }

                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: '이메일 입력',
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _password,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '비밀번호를 입력해주세요';
                }
                if (value.length < 6) {
                  return "6자리 이상 입력해주세요";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "비밀번호 입력",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordcheck,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '비밀번호를 입력해주세요';
                }
                if (value != _password.text) {
                  return '비밀번호가 맞지 않습니다.';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "비밀번호 확인",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '닉네임을 입력해주세요';
                }
                if (value.length < 2) {
                  return "2자리 이상 입력해주세요";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "닉네임 입력",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
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
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var request = {
                        "email": _email.text,
                        "password": _password.text,
                        "name": _name.text,
                      };
                      String url = "http://moic-findit.site:3000/app/users";
                      var body = json.encode(request);
                      http.Response response = await http.post(Uri.parse(url),
                          headers: {"Content-Type": "application/json"},
                          body: body);

                      final responseData = json.decode(response.body);

                      if (response.statusCode == 200) {
                        // If the call to the server was successful, parse the JSON
                        print(responseData);
                      } else {
                        // If that call was not successful, throw an error.
                        throw Exception('Failed to load post');
                      }
                    }
                  },
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
        ));
  }

  Future<dynamic> signup(Map<String, dynamic> request) async {
    String url = "http://moic-findit.site:3000/app/users";
    var body = json.encode(request);
    http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return print(responseData);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
