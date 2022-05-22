import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'Login_page.dart';
class welcome_page extends StatefulWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  _welcome_pageState createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen(
            duration: 5000,
            splash: Text("Kidoli",style: TextStyle(
              fontSize: 30
            ),),
            nextScreen: login_page(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.rightToLeft,

            )));

  }
}
