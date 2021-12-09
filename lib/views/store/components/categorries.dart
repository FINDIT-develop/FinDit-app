import 'package:flutter/material.dart';

import '../../../views/constants/constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["전체", "아우터", "상의", "바지", "원피스", "스커트", "투피스/세트"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color:
                          selectedIndex == index ? kActiveColor : Colors.white),
                  borderRadius: BorderRadius.circular(15),
                  color: selectedIndex == index ? kActiveColor : Colors.white),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color:
                      selectedIndex == index ? Colors.white : kTextLightColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
