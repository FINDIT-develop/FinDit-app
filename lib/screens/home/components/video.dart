import 'package:FinDit/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({Key key}) : super(key: key);

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
              imageUrl: "http://www.kint.kr/design/kint/img/main/cr_ytb_02.png",
              placeholder: (context, url) => Container(
                    height: 230,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              fit: BoxFit.fitWidth),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
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
                Row(
                  children: [
                    Text(
                      "임현주 I’M HYEONJOO",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(" | "),
                    Text(
                      "2021.09.27",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [_thumbnail(), _simpleDetailInfo()],
      ),
    );
  }
}
