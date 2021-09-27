import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FinDit/screens/bottomnavbar.dart';
import 'package:FinDit/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FINDIT APP',
        theme: theme(),
        home: BottomNavBar());
  }
}
