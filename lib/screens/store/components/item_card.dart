import 'package:FinDit/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   width: 70,
          //   margin: const EdgeInsets.only(left: 5, bottom: 10),
          //   padding: const EdgeInsets.all(6.0),
          //   child: Row(
          //     children: [
          //       GestureDetector(
          //         child: Icon(
          //           Icons.play_arrow,
          //           size: 15,
          //         ),
          //       ),
          //       Text(
          //         "01:31",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          //       ),
          //     ],
          //   ),
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 0.75, color: kTextLightColor),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          // ),
          Expanded(
            child: Container(
              //padding: EdgeInsets.all(kDefaultPadding),
              // For  demo we use fixed height  and width
              // Now we dont need them
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 180,
              width: 160,

              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                  tag: "${product.id!}",
                  child: Image.asset(product.imageLink!, fit: BoxFit.cover)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 4),
                      child: Text(
                        // products is out demo list
                        product.name!,
                        style: TextStyle(color: kTextLightColor, fontSize: 14),
                      ),
                    ),
                    Text(
                      "${product.price!}원",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("assets/icons/like_active.svg"),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
