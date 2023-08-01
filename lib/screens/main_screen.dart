import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create/screens/chat/chat_screen.dart';
import 'package:flutter_create/screens/home/home_screen.dart';
import 'package:flutter_create/screens/hub/hub_screen.dart';
import 'package:flutter_create/screens/learn/learn_screen.dart';
import 'package:flutter_create/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTab = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const LearnScreen(),
    const HubScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade600,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle:
            TextStyle(color: Colors.blue.shade600, fontWeight: FontWeight.w600),
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_sharp,
            ),
            label: "Learn",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.now_widgets_outlined,
            ),
            label: "Hub",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
