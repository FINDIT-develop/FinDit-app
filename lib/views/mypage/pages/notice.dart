import 'package:FinDit/views/constants/constants.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "공지사항",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: kActiveColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 40.0),
            ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(
                      "[공지] 영상 패션 검색 플랫폼, 핀딧 베타 런칭 ✨",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        color: kActiveColor,
                      ),
                    ),
                    children: <Widget>[
                      Text(
                        '''
반가워요!
                               
12/15일부터 핀딧 베타 서비스를 시작합니다!
서비스 문의 / 피드백 : moic.peach@gmail.com
위 연락처로 연락 주시면 항상 귀기울여 듣고 서비스 개선에 반영하겠습니다.
      ''',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: kTextColor,
                            height: 1.5),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(
                      "[이벤트] 테스터 모집",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kActiveColor,
                      ),
                    ),
                    children: <Widget>[
                      Text(
                        '''
      핀딧과 함께할 테스터를 모집합니다!
      ''',
                        style: TextStyle(
                            fontSize: 13, color: kTextColor, height: 1.5),
                      ),
                    ],
                  ),
                ],
              ).toList(),
            ),
            SizedBox(height: 10.0),
          ]),
        ),
      ),
    );
  }
}
