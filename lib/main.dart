import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/guide.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';
import 'package:flutter_application_1/widgets/NavDrawer.dart';

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
      //initialRoute: '/',
      //routes: {
      //  '/': (context) => const MyHomePage(title: '너와 나의 은밀한울림'),
      //  '/guide': (context) => const GuideScreen()
      //},
      home: const MyHomePage(title: '너와 나의 은밀한울림'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) CustomVibration.cancel();
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        title: Text(widget.title),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Container(
          //width: double.infinity,
          margin: const EdgeInsets.all(20),
          child:
              _selectedIndex == 0 ? const HomeScreen() : const GuideScreen()),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '가이드',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
