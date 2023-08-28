import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';
import 'package:flutter_application_1/widgets/navDrawer.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.child});

  final Widget child;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (!context.mounted) return;
    switch (index) {
      case 0:
        Navigator.of(context).popAndPushNamed(RouteName.home);
        break;
      case 1:
        Navigator.of(context).popAndPushNamed(RouteName.guide);
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  final String title = '너와 나의 은밀한울림';

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> list = [];
    bottomNavigationItems.forEach((key, value) {
      list.add(value);
    });

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        title: Text(title),
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
      body: Container(margin: const EdgeInsets.all(20), child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        items: list,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
