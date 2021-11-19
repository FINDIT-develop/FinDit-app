import 'package:FinDit/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSetting extends StatefulWidget {
  const PushSetting({Key? key}) : super(key: key);

  @override
  _PushSettingState createState() => _PushSettingState();
}

class _PushSettingState extends State<PushSetting> {
  @override
  Widget build(BuildContext context) {
    var isSwitched = false;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "푸시 알림",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: kActiveColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0),
            Text("푸시 알림에 관한 설정은 '설정 앱 > 알림 > FINDIT'에서 변경할 수 있습니다."),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "마케팅 정보 알림",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: kActiveColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.italic
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: CupertinoSwitch(
                    value: isSwitched,
                    activeColor: kActiveColor,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text("할인 혜택 및 마케팅 정보 알림을 보내드립니다."),
          ]),
        ),
      ),
    );
  }
}
