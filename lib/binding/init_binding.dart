import 'package:FinDit/controllers/app_controller.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/repository/product_service.dart';
import 'package:FinDit/repository/youtube_service.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeService(), permanent: true);
    Get.put(AppController());
    Get.put(ProductService());
  }
}
