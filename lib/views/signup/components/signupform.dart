import 'dart:convert';

import 'package:FinDit/controllers/user_controller.dart';
import 'package:FinDit/views/signin/signin_screen.dart';
import 'package:FinDit/views/widgets/dialog_helper.dart';
import 'package:FinDit/views/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:FinDit/views/constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordcheck = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isChecked = false;
  bool isChecked_privacy = false;
  bool isChecked_service = false;
  bool isChecked_marketing = false;

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
                fontSize: 27,
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
                if (!value.isEmail) {
                  return "이메일 형식이 아닙니다.";
                }
                return null;
              },
              cursorColor: kActiveColor,
              style: TextStyle(fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: '이메일 입력',
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kActiveColor)),
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
              cursorColor: kActiveColor,
              style: TextStyle(fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "비밀번호 입력",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kActiveColor)),
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
              cursorColor: kActiveColor,
              style: TextStyle(fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "비밀번호 확인",
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kActiveColor)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '닉네임을 입력해주세요.';
                }

                return null;
              },
              cursorColor: kActiveColor,
              style: TextStyle(fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: '닉네임 입력',
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kActiveColor)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              height: 30,
              child: Row(
                children: [
                  Checkbox(
                      activeColor: kActiveColor,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked == false) {
                            isChecked_service = false;
                            isChecked_privacy = false;
                            isChecked_marketing = false;
                          } else {
                            isChecked_service = true;
                            isChecked_privacy = true;
                            isChecked_marketing = true;
                          }
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
                      activeColor: kActiveColor,
                      value: isChecked_service,
                      onChanged: (value) {
                        setState(() {
                          isChecked_service = value!;
                          if (isChecked_service == false) {
                            isChecked = false;
                          }
                        });
                      }),
                  Text("[필수] 이용약관에 동의합니다.")
                ],
              ),
            ),
            Container(
              height: 30,
              child: Row(
                children: [
                  Checkbox(
                      activeColor: kActiveColor,
                      value: isChecked_privacy,
                      onChanged: (value) {
                        setState(() {
                          isChecked_privacy = value!;
                          if (isChecked_privacy == false) {
                            isChecked = false;
                          }
                        });
                      }),
                  Text("[필수] 개인정보 수집 및 이용에 동의합니다.")
                ],
              ),
            ),
            Container(
              height: 30,
              child: Row(
                children: [
                  Checkbox(
                      activeColor: kActiveColor,
                      value: isChecked_marketing,
                      onChanged: (value) {
                        setState(() {
                          isChecked_marketing = value!;
                          if (isChecked_marketing == false) {
                            isChecked = false;
                          }
                        });
                      }),
                  Text("[선택] 광고성 정보 수신에 모두 동의합니다.")
                ],
              ),
            ),
            SizedBox(height: 40.0),
            PrimaryButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (isChecked_service == true &&
                        isChecked_privacy == true) {
                      await _register().then((UserCredential? userCredential) {
                        userCredential!.user!.updateDisplayName(_name.text);
                      });
                      await Get.dialog(CupertinoAlertDialog(
                        title: Text("회원가입 성공"),
                        content: Text("회원가입을 축하드립니다!🥳"),
                        actions: [
                          CupertinoDialogAction(
                            child: Text(
                              "확인",
                              style: TextStyle(fontSize: 13),
                            ),
                            onPressed: () => Get.offAll(() => SignInScreen()),
                          )
                        ],
                      ));
                    } else {
                      DialogHelper.showErrSnackbar(
                          title: "약관 미동의", description: "약관에 동의해주세요");
                    }
                  }
                },
                text: "회원가입"),
            SizedBox(height: 20.0),
          ],
        ));
  }

  Future<UserCredential?> _register() async {
    try {
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogHelper.showErrSnackbar(
            title: "취약한 비밀번호", description: "비밀번호가 취약합니다.");
      } else if (e.code == 'email-already-in-use') {
        DialogHelper.showErrSnackbar(
            title: "이메일 중복", description: "이미 존재하는 계정입니다. 다른 이메일을 입력해주세요!");
      }
    } catch (e) {
      DialogHelper.showErrSnackbar(description: e.toString());
    }
  }
}
