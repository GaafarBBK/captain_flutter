import 'package:flutter/material.dart';
import 'package:captain11/models/user_model.dart';
import 'package:captain11/screen/bottm_navigation/HomePage.dart';
import 'package:captain11/screen/bottm_navigation/StorePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  final int weight = 80;

  final List<Widget> _pages = [
    StorePage(),
    TodayPage(),
    HomePage(weight: 70,),
  ];

  final List<Widget?> _drawer = [null, null, Drawer()];
  final List<PreferredSizeWidget?> appbars = [
    StoreAppBar(),
    null,
    HomeAppBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbars[_selectedIndex],
      drawer: _drawer[_selectedIndex],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'اليوم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
