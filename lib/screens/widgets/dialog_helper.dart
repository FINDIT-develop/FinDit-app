import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog({String title = 'Error', String? description}) {
    Get.dialog(CupertinoAlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        description ?? '',
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            '확인',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    ));
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
