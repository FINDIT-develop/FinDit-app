import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  @override
  void onInit() async {
    SharedPreferences profs = SharedPreferences.getInstance() as SharedPreferences;
    String value = (profs.get("testString") as String);
    profs.setString("testString", "개발하는남자");
    print(value);
    super.onInit();
  }
}
