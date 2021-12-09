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
          title: Text(
            "스토어",
            style: TextStyle(color: kActiveColor),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Categories(),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(
                      kDefaultPadding,
                    ),
                    child: GridView.builder(
                        itemCount: controller.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPadding,
                          crossAxisSpacing: kDefaultPadding,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                            product: controller.products[index],
                            press: () {}))),
              ),
            ]));
  }
}
