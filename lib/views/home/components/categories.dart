import 'package:flutter/material.dart';

import 'package:FinDit/views/constants/constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["데일리", "페미닌", "모던시크", "오피스", "러블리"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      selectedIndex == index ? kActiveColor : Colors.grey[100]),
              child: Text(
                categories[index],
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: selectedIndex == index ? Colors.white : kTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
