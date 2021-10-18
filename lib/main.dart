import 'package:FinDit/binding/init_binding.dart';
import 'package:FinDit/constants/theme.dart';
import 'package:FinDit/controllers/video_cotroller.dart';

import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:FinDit/screens/search/search_screen.dart';
import 'package:FinDit/screens/video_detail/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FinDit/screens/app.dart';
import 'controllers/search_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FinDit APP',
      theme: theme(),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
          name: "/detail/:videoId",
          page: () => VideoDetailScreen(),
          binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()),
          ),
        ),
        GetPage(
          name: "/search",
          page: () => SearchScreen(),
          binding: BindingsBuilder(
            () => Get.lazyPut<SearchController>(() => SearchController()),
          ),
        )
      ],
    );
  }
}
