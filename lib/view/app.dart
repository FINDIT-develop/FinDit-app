import 'package:FinDit/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/view/home/home_screen.dart';
import 'package:FinDit/view/like/like_screen.dart';
import 'package:FinDit/view/mypage/mypage_screen.dart';
import 'package:FinDit/view/store/store_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _navitems = [
      {
        "icon": "assets/icons/home.svg",
        "active_icon": "assets/icons/home_active.svg",
        "title": "HOME"
      },
      {
        "icon": "assets/icons/store.svg",
        "active_icon": "assets/icons/store_active.svg",
        "title": "STORE"
      },
      {
        "icon": "assets/icons/like.svg",
        "active_icon": "assets/icons/like_active.svg",
        "title": "LIKE"
      },
      {
        "icon": "assets/icons/my.svg",
        "active_icon": "assets/icons/home_active.svg",
        "title": "MY"
      },
    ];
    List _view = [HomeScreen(), StoreScreen(), LikeScreen(), MyPageScreen()];
    return Scaffold(
        body: Obx(() => _view[controller.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePageIndex,
            backgroundColor: Colors.white,
            selectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: List.generate(
              _navitems.length,
              (index) => BottomNavigationBarItem(
                  icon: buildSvgIcon(
                    src: _navitems[index]['icon'],
                  ),
                  activeIcon: buildSvgIcon(
                    src: _navitems[index]['active_icon'],
                  ),
                  tooltip: _navitems[index]["title"],
                  label: ""),
            ),
          ),
        ));
  }

  SvgPicture buildSvgIcon({@required String src, bool isActive = false}) {
    return SvgPicture.asset(
      src,
      width: 25,
      height: 25,
      color: kActiveColor,
    );
  }
}
