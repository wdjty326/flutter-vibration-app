import 'package:flutter/material.dart';

/// 사이드 메뉴
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                '너와 나의 은밀한울림',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text(
                '메인',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => {},
            ),
          ],
        ));
  }
}
