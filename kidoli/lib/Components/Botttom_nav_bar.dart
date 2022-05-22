// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kidoli/Main_packages/Profile.dart';
import 'package:kidoli/Welcome/Login_page.dart';
import 'package:kidoli/video_player/vid_new.dart';
import 'package:line_icons/line_icons.dart';

import '../Main_packages/Home.dart';
import '../Main_packages/library.dart';

class bottom_nav_bar extends StatefulWidget {
  const bottom_nav_bar({Key? key}) : super(key: key);

  @override
  _bottom_nav_barState createState() => _bottom_nav_barState();
}

class _bottom_nav_barState extends State<bottom_nav_bar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    home_main(),
    test(),
    //vid_list(),
    VideoApp(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '1': (context) => login_page(),
      },
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.pinkAccent,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,

                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.book,
                    text: 'Library',
                  ),
                  GButton(
                    icon: LineIcons.video,
                    text: 'Videos',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
