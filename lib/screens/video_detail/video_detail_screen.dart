import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/models/Product.dart';
import 'package:FinDit/screens/details/details_screen.dart';
import 'package:FinDit/screens/store/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/video.dart';

class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[400],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "eng. 2년 만에 찾아온 나 혼자만의 시간... 나홀로 즐기는 장미빛 하루🌹VLOG",
                  style: TextStyle(height: 1.2),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {},
                child: SvgPicture.asset("assets/icons/like_active.svg")),
          )
        ],
      ),
    );
  }

  Widget _inthisvideo() {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("영상 속 정보",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: products[index],
                              ),
                            )),
                      )),
            ),
          ]),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _titleZone(),
          Divider(
            thickness: 10,
            color: Colors.grey[100],
          ),
          _inthisvideo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 230,
              child: Video(),
            ),
            Expanded(
              child: _description(),
            )
          ],
        ),
      ),
    );
  }
}
