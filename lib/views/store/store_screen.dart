import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/models/product.dart';
import 'package:FinDit/services/product_service.dart';
import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/categorries.dart';
import 'components/item_card.dart';

class StoreScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onTap: () => Get.toNamed("search/"),
            decoration: InputDecoration(
                fillColor: Colors.grey[200],
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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Categories(),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    itemCount: controller.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6,
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
              )),
            ]));
  }
}
