import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/ui/pages/account.dart';
import 'package:quizapp/ui/pages/home.dart';
import 'package:quizapp/ui/pages/leaderboard.dart';

class MyBottomNavigationBar extends StatefulWidget {
  static const routeName = 'navy-bar';
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 1;
  final List<Widget> _children = [
    Leaderboard(),
    HomePage(),
    MyAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: FancyBottomNavigation(
        activeIconColor: Colors.blueAccent[300],
        circleColor: Colors.blueAccent[300],
        inactiveIconColor: Colors.blueAccent[100],
        tabs: [
          TabData(
            iconData: Icons.leaderboard,
            title: "Leaderboard",
            onclick: () {},
          ),
          TabData(
            iconData: Icons.home,
            title: "Home",
            onclick: () {},
          ),
          TabData(
            iconData: Icons.person,
            title: "Account",
            onclick: () {},
          ),
        ],
        initialSelection: currentIndex,
        onTabChangedListener: (position) {
          setState(() {
            currentIndex = position;
          });
        },
      ),
    );
  }
}
