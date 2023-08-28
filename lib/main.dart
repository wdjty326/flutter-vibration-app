import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '너와 나의 은밀한울림', // 안드로이드 최근 사용앱 노출명
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      routes: namedRoutes,
    );
  }
}
