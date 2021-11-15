import 'package:FinDit/screens/app.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';
import 'package:FinDit/screens/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Text(
            "반가워요!",
            style: TextStyle(fontSize: 17, color: kActiveColor),
          ),
          SizedBox(height: 5),
          Text(
            "핀딧에서 궁금했던 옷을 찾아보세요 :)",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: kActiveColor),
          ),
          SizedBox(height: 50.0),
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
                return '비밀번호를 입력해주세요.';
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
          SizedBox(height: 40.0),
          PrimaryButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await signin().then((UserCredential? userCredential) {
                    if (userCredential != null) {
                      Get.offAll(() => App(), arguments: userCredential.user);
                    }
                  });
                }
              },
              text: "로그인"),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Future<UserCredential?> signin() async {
    try {
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          DialogHelper.showErrSnackbar(description: '이메일 형식이 맞지 않습니다.');
          break;
        case 'wrong-password':
          DialogHelper.showErrSnackbar(description: '비밀번호가 올바르지 않습니다.');
          break;
        case 'user-not-found':
          DialogHelper.showErrSnackbar(description: "가입된 이메일이 아닙니다.");
          break;
        case 'user-disabled':
          DialogHelper.showErrSnackbar(description: e.code);
          break;
        case 'too-many-requests':
          DialogHelper.showErrSnackbar(description: e.code);
          break;
        case 'operation-not-allowed':
          DialogHelper.showErrSnackbar(description: e.code);
          break;
      }
      return null;
    } catch (e) {
      DialogHelper.showErrSnackbar(description: e.toString());
    }
  }
}
