import 'package:FinDit/models/product.dart';
import 'package:FinDit/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/constants/constants.dart';
import 'package:get/get.dart';

import 'categorries.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Get.to(
                          () => ProductDetailScreen(
                            product: products[index],
                          ),
                        ))),
          ),
        ),
      ],
    );
  }
}
