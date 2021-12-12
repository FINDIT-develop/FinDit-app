import 'package:flutter/material.dart';

class LikeProduct extends StatelessWidget {
  const LikeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [];
    if (list.isEmpty) {
      return Center(
        child: Text("마음에 드는 제품을 \n♡를 눌러서 저장할 수 있어요",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.grey, fontFamily: "Montserrat")),
      );
    } else {
      return Container();
    }
  }
}
