import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/guide.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/utilities/customVibration.dart';

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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    debugPrint('life state:${state.toString()}');
    bool isVibrate = await CustomVibration.hasVibrator();
    switch (state) {
      case AppLifecycleState.inactive:
        if (isVibrate) CustomVibration.cancel();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        title: Text(widget.title),
      ),
      body: Container(
          //width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: _selectedIndex == 0 ? const HomeScreen() : GuideScreen()),
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
