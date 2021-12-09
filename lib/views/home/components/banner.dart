import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290.0,
        viewportFraction: 1,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.fitWidth,
                ));
          },
        );
      }).toList(),
    );
  }
}
