import 'package:FinDit/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../views/constants/constants.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    bool isLiked = true;
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.product.image!,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        isLiked
                            ? "assets/icons/like_full.svg"
                            : "assets/icons/like_icon.svg",
                        width: 20,
                        color: kPointColor,
                      ),
                      onTap: () {
                        bool value = !isLiked;
                        setState(() {
                          isLiked = value;
                        });
                      },
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                  child: Text(
                    widget.product.name!,
                    maxLines: 1,
                    style: TextStyle(
                        color: kTextLightColor,
                        fontSize: 14,
                        fontFamily: "Montserrat"),
                  ),
                ),
                Text(
                  "${NumberFormat('###,###,###,###').format(widget.product.price).replaceAll(' ', '')}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
