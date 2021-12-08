import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';

class InquireScreen extends StatelessWidget {
  const InquireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "1:1 문의",
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: kActiveColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic
            ),
          ),
          SizedBox(height: 40.0),
          Text(
            "상담시간",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: 'Montserrat',
              color: kActiveColor,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "평일(월-금) 10:00 ~ 17:00\n(점심시간 12:00 ~ 13:00, 토/일/공휴일 휴무)",
            style: TextStyle(
                fontFamily: 'Montserrat', color: kActiveColor, height: 1.5),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50,
            color: Color(0xFFFFE812),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            //   border: Border.all(
            //     color: kActiveColor,
            //     width: 1,
            //   ),
            // ),
            child: Center(
              child: Text(
                "카카오톡 플러스 친구",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
