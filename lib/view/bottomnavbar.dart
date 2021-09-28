import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/view/home/home_screen.dart';
import 'package:FinDit/view/like/like_screen.dart';
import 'package:FinDit/view/mypage/mypage_screen.dart';
import 'package:FinDit/view/store/store_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar();
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

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

  List<Widget> _view;
  @override
  void initState() {
    super.initState();
    _view = [
      HomeScreen(),
      StoreScreen(),
      LikeScreen(),
      MyPageScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _view[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: kActiveColor,
        selectedItemColor: kActiveColor,
        //iconSize: 11,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: buildSvgIcon(
                src: _navitems[index]['icon'],
                isActive: index == _selectedIndex),
            activeIcon: buildSvgIcon(
                src: _navitems[index]['active_icon'],
                isActive: index == _selectedIndex),
            label: _navitems[index]["title"],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
