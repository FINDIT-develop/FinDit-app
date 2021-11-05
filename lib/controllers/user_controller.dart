import 'package:FinDit/models/user.dart';
import 'package:FinDit/repository/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;

  void signup(var request) async {
    User? userResult = await UserService.to.postSignUp(request);

    print(userResult);
  }
}
