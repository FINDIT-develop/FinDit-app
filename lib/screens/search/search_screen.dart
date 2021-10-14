import 'package:FinDit/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 45,
          padding: const EdgeInsets.only(right: 20),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "영상, 상품을 검색해보세요 !",
                contentPadding: EdgeInsets.only(left: 20, bottom: 0, right: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
