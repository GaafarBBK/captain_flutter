import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/screen/bottm_navigation/HomePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';

class StorePage extends StatefulWidget {
  StorePage({super.key});
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StorePage()),
        );
      }
      if (_selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TodayPage()),
        );
      }
      if (_selectedIndex == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
    );
  }
}

PreferredSizeWidget StoreAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'متجر ',
      style: GoogleFonts.changa(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    actions: [
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      )
    ],
    backgroundColor: Colors.blue,
  );
}
