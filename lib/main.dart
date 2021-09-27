import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moic/screens/bottomnavbar.dart';
import 'package:moic/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: BottomNavBar());
  }
}
