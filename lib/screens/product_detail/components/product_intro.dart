import 'package:flutter/material.dart';
import 'package:FinDit/models/product.dart';

import 'package:FinDit/constants/constants.dart';

class ProductIntro extends StatelessWidget {
  const ProductIntro({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "de ondo",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "드 온도 화이트 핀턱팬츠",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${product.price}원",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 0.75,
              color: Colors.grey[200],
            ),
          ]),
    );
  }
}
