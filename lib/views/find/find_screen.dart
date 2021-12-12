import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/constants/size_config.dart';
import 'package:FinDit/views/find/components/tags.dart';
import 'package:FinDit/views/store/components/item_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindScreen extends StatelessWidget {
  FindScreen({Key? key}) : super(key: key);
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
      ),
      body: Column(
        children: [
          CachedNetworkImage(
              imageUrl:
                  "https://thumb.mt.co.kr/06/2020/09/2020092911204170869_1.jpg/dims/optimize/"),
          Container(
            width: 500,
            color: kActiveColor,
            padding: const EdgeInsets.all(10),
            child: Text(
              "이 영상의 00:00초 의류 검색 결과입니다.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Tags(controller),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: controller.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.58,
                  ),
                  itemBuilder: (context, index) => Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ItemCard(
                            product: controller.productList[index],
                            press: () {
                              Get.toNamed(
                                  "/product/${controller.productList[index].productId}",
                                  arguments: controller.productList[index]);
                            },
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
