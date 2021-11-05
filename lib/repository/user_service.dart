import 'dart:convert';

import 'package:FinDit/models/user.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserService extends GetConnect {
  static UserService get to => Get.find();
  @override
  void onInit() {
    httpClient.baseUrl = "https://moic-findit.site:3000";
    super.onInit();
  }

  Future<String?> signup(Map<String, dynamic> request) async {
    String url = "https://moic-findit.site:3000/app/users";
    var body = json.encode(request);
    http.Response response = await http.post(Uri.parse(url), body: body);

    String responsebody = response.body;

    if (response.statusCode == 200) {
      return "회원가입에 성공했습니다";
    } else {
      return Future.error(responsebody);
    }
  }

  Future<User?> postSignUp(Map<String, dynamic> request) async {
    String url = "/app/users";
    var body = json.encode(request);
    final response = await post(url, body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["result"] != null &&
          response.body["result"].length > 0) {
        Map<String, dynamic> data = response.body["result"][0];
        return User.fromJson(data["result"]);
      }
    }
  }
}
