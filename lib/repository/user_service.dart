import 'package:FinDit/models/user.dart';
import 'package:get/get.dart';


class UserService extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = "https://moic-findit.site/";
    super.onInit();
  }

  Future<User?> signup( Map<String,dynamic> body ) async {
   
    String url = "/app/users";
    final response = await post(url,body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body != null) {
        return User.fromJson(response.body);
      }
    }
  }
  Future<User?> signin() async {
    String url = "/api/users/signin";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body != null) {
        return User.fromJson(response.body);
      }
    }
  }
}
