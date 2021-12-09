import 'package:flutter/material.dart';
import 'package:FinDit/models/product.dart';

import 'package:FinDit/views/constants/constants.dart';
import 'package:intl/intl.dart';

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
              product.brand!,
              style:
                  TextStyle(color: Colors.grey[600], fontFamily: "Montserrat"),
            ),
            SizedBox(height: 10),
            Text(
              product.name!,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"),
            ),
            SizedBox(height: 10),
            Text(
              "${NumberFormat('###,###,###,###').format(product.price).replaceAll(' ', '')}원",
              style: TextStyle(
                  fontFamily: "Montserrat",
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
