import 'package:firebase_chat2/pages/people_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calls_page.dart';
import 'chats_page.dart';
import 'settings_screen_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var screns = [
    const Chats(),
    const Calls(),
    const People(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        border: const Border(top: BorderSide(color: Colors.blue, width: 0.0)),
        items: const [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(CupertinoIcons.chat_bubble_2),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            label: "People",
            icon: Icon(Icons.people_outline_sharp),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return screns[index];
      },
    ));
  }
}
