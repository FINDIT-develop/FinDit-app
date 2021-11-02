import 'dart:convert';

import 'package:FinDit/controllers/base_controller.dart';
import 'package:FinDit/models/user.dart';
import 'package:FinDit/repository/app_exceptions.dart';
import 'package:FinDit/repository/base_client.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';
import 'package:get/get.dart';

class UserController extends GetxController with BaseController {
  Rx<User> user = User().obs;

  void signin(var request) async {
    showLoading('Login...');
    var response = await BaseClient()
        .post("http://moic-findit.site", '/app/users', request)
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

  void signup(var request) async {
    var response = await BaseClient()
        .post("http://moic-findit.site:3000", "/app/users", request)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print(error.message);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
  
    print(response);
  }
}
