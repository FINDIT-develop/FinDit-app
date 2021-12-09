import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/models/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 350.0,
        viewportFraction: 1,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: CachedNetworkImage(
                    imageUrl: product.image!, fit: BoxFit.cover));
          },
        );
      }).toList(),
    );
  }
}
