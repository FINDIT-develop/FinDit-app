import 'package:FinDit/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErrDialog({String title = 'Error', String? description}) {
    Get.dialog(CupertinoAlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        description ?? '',
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Get.back(),
          child: Text(
            '확인',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    ));
  }

  static void showErrSnackbar({String title = 'Error', String? description}) {
    Get.snackbar(title, description ?? '',
        backgroundColor: kActiveColor,
        colorText: Colors.white,
        duration: Duration(seconds: 2));
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(message ?? 'Loading...'),
        content: Column(
          children: [
            SizedBox(height: 15),
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
