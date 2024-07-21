import 'package:baseapp/app/main/home_screen.dart';
import 'package:baseapp/app/main/profile_screen.dart';
import 'package:baseapp/router/list_nav_item.dart';
import 'package:flutter/material.dart';

import 'notification_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String route = '/mainPage';

  @override
  MainPageState createState() => MainPageState();
}

final _navigatorKey = GlobalKey();
final _navigatorKeySetting = GlobalKey();

class MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()


  ];
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );


    return Scaffold(
      body:


      _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (i) => setState(() {
          selectedIndex = i;
        }),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: tabs,
      ),
    );
  }
}
