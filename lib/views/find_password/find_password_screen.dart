import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/signin/signin_screen.dart';
import 'package:FinDit/views/widgets/dialog_helper.dart';
import 'package:FinDit/views/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({Key? key}) : super(key: key);

  @override
  _FindPasswordScreenState createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "비밀번호 찾기",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: kActiveColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "가입 시 사용한 이메일 주소를 입력하시면, \n비밀번호를 재설정할 수 있는 메일을 발송해드립니다.",
                style: TextStyle(
                  //fontFamily: 'Montserrat',
                  color: kActiveColor,
                ),
              ),
              SizedBox(height: 30.0),
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
              SizedBox(height: 40.0),
              PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await resetPassword(_email.text);
                    }
                  },
                  text: "비밀번호 재설정 메일 보내기")
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      await Get.dialog(CupertinoAlertDialog(
          title: Text("전송 완료"),
          content: Text(
            "비밀번호 재설정을 위한 \n이메일을 발송하였습니다.",
            style: TextStyle(fontSize: 13, height: 1.3),
            textAlign: TextAlign.center,
          ),
          actions: [
            CupertinoDialogAction(
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () => Get.off(() => SignInScreen()))
          ]));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogHelper.showErrSnackbar(description: "가입된 회원이 아닙니다.");
      }
    }
    ;
  }
}
