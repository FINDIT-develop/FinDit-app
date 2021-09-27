import 'package:flutter/material.dart';
import 'package:FinDit/constants.dart';
import 'package:FinDit/screens/home/home_screen.dart';
import 'package:FinDit/screens/like/like_screen.dart';
import 'package:FinDit/screens/mypage/mypage_screen.dart';
import 'package:FinDit/screens/store/store_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar();
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "HOME"},
    {"icon": "assets/icons/store.svg", "title": "STORE"},
    {"icon": "assets/icons/like.svg", "title": "LIKE"},
    {"icon": "assets/icons/my.svg", "title": "MY"},
  ];

  List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(),
      StoreScreen(),
      LikeScreen(),
      MyPageScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: kActiveColor,
        selectedItemColor: kActiveColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        //iconSize: 11,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: buildSvgIcon(
                src: _navitems[index]['icon'],
                isActive: _selectedIndex == index),
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
