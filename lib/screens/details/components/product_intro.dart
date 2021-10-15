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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "모코블링",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "오버핏 싱글자켓 아이보리 파자마 자켓 바지인줄 알았는데 조끼",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                    text: "${product.price}원",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ])
        ]);
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
