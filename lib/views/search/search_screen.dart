import 'package:FinDit/controllers/search_controller.dart';
import 'package:FinDit/services/product_service.dart';
import 'package:FinDit/views/widgets/video_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);
  Widget _searchHistory() {
    return ListView(
      children: List.generate(controller.history.length, (index) {
        return ListTile(
          onTap: () {
            controller.submitSearch(controller.history[index]);
          },
          title: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 3),
            child: Text("${controller.history[index]}"),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        );
      }),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(
            controller.youtubeVideoResult.value.items.length, (index) {
          return GestureDetector(
            onTap: () {
              //page route
              Get.toNamed(
                  "/detail/${controller.youtubeVideoResult.value.items[index].id!.videoId}");
            },
            child: VideoWidget(
                video: controller.youtubeVideoResult.value.items[index]),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 45,
          padding: const EdgeInsets.only(right: 20),
          child: TextField(
            onSubmitted: (key) {
              controller.submitSearch(key);
            },
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
      body: Obx(
        () => controller.youtubeVideoResult.value.items.length > 0
            ? _searchResultView()
            : _searchHistory(),
      ),
    );
  }
}
