import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/guide.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/splash.dart';

class RouteName {
  static const splash = '/';
  static const home = '/home';
  static const guide = '/guide';
}

var namedRoutes = <String, WidgetBuilder>{
  RouteName.splash: (context) => const SplashScreen(),
  RouteName.home: (context) => const HomeScreen(),
  RouteName.guide: (context) => const GuideScreen(),
};

var bottomNavigationItems = const <int, BottomNavigationBarItem>{
  0: BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '홈',
  ),
  1: BottomNavigationBarItem(
    icon: Icon(Icons.book),
    label: '가이드',
  )
};
