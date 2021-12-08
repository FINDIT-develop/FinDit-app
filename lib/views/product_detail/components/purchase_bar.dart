import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FinDit/models/product.dart';

import 'package:FinDit/views/constants/constants.dart';

class PurchaseBar extends StatelessWidget {
  const PurchaseBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/like.svg",
              color: kActiveColor,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: kActiveColor,
                onPressed: () {},
                child: Text(
                  "구매 사이트 바로가기",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
