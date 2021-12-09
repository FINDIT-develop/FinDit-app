import 'package:FinDit/binding/init_binding.dart';
import 'package:FinDit/views/constants/theme.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:FinDit/views/root.dart';
import 'package:FinDit/views/search/search_screen.dart';
import 'package:FinDit/views/store/store_screen.dart';
import 'package:FinDit/views/video_detail/video_detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/search_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FINDIT APP',
      theme: theme(),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => RootPage(),
        ),
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
