import 'package:flutter/material.dart';
import 'package:FinDit/model/Product.dart';

import '../../../constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: "${product.id}",
          child: Image.asset(
            "assets/images/dummy.png",
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: kDefaultPadding),
      ],
    );
  }
}
