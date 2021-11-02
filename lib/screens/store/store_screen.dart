import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/categorries.dart';
import 'components/item_card.dart';

class StoreScreen extends StatelessWidget {
  final controller = Get.isRegistered<ProductController>()
      ? Get.find<ProductController>()
      : Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "스토어",
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Categories(),
          Expanded(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(
                    kDefaultPadding,
                  ),
                  child: GridView.builder(
                      itemCount: controller.productList.value.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPadding,
                        crossAxisSpacing: kDefaultPadding,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                          product: controller.productList.value[index],
                          press: () => Get.to(
                                () => ProductDetailScreen(
                                  product: controller.productList.value[index],
                                ),
                              ))),
                )),
          ),
        ],
      ),
    );
  }
}
