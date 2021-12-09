import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/root.dart';
import 'package:FinDit/views/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _name = TextEditingController(text: user!.displayName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원정보 수정",
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextField(
                cursorColor: kActiveColor,
                style: TextStyle(fontFamily: 'Montserrat'),
                readOnly: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: kActiveColor),
                  labelText: '이메일',
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'yeonns2@gmail.com',
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
              SizedBox(height: 20),
              TextFormField(
                controller: _name,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return '변경할 이름을 입력해주세요.';
                  }
                },
                cursorColor: kActiveColor,
                style: TextStyle(fontFamily: 'Montserrat'),
                decoration: InputDecoration(
                  labelText: '이름',
                  labelStyle: TextStyle(color: kActiveColor),
                  contentPadding: EdgeInsets.all(10),
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
              SizedBox(
                height: 40,
              ),
              PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await user!.updateDisplayName(_name.text);
                      await Get.offAll(() => RootPage());
                    }
                  },
                  text: "수정하기")
            ]),
          ),
        ),
      ),
    );
  }
}
