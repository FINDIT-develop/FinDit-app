import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
// We need satefull widget for our LikeCategory

class LikeCategory extends StatefulWidget {
  @override
  _LikeCategoryState createState() => _LikeCategoryState();
}

class _LikeCategoryState extends State<LikeCategory> {
  List<String> LikeCategory = ["영상", "상품"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: LikeCategory.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            LikeCategory[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: selectedIndex == index ? kTextColor : kTextLightColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
            height: 2,
            width: 150,
            color: selectedIndex == index ? Colors.black : Colors.transparent,
          )
        ],
      ),
    );
  }
}
