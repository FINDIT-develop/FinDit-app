import 'package:FinDit/controllers/app_controller.dart';
import 'package:FinDit/repository/youtube_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
