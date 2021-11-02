import 'dart:convert';

import 'package:FinDit/repository/app_exceptions.dart';
import 'package:FinDit/repository/base_client.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

class TestController extends GetxController with BaseController {
  void getData() async {
    showLoading('Fetching data');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/posts/1')
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    var request = jsonEncode(<String, String>{'message': 'CodeX sucks!!!'});
    showLoading('Posting data...');
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', request)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
