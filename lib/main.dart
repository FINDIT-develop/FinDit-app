import 'package:FinDit/binding/init_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FinDit/screens/app.dart';
import 'package:FinDit/constants/theme.dart';

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
      getPages: [GetPage(name: "/", page: () => App())],
    );
  }
}
