import 'package:FinDit/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/constants/constants.dart';

// We need satefull widget for our Tags

class Tags extends StatefulWidget {
  Tags(this.controller);
  final ProductController controller;
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<String> Tags = ["검정", "아우터", "상의"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        scrollDirection: Axis.horizontal,
        itemCount: Tags.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.controller.loadProductByCategory(selectedIndex);
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
                Tags[index],
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
