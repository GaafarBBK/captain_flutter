import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:captain11/screen/bottm_navigation/StorePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  int _currentValue = 3;

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

  PreferredSizeWidget HomeAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'هوم ',
        style: GoogleFonts.changa(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        Column(
          children: <Widget>[
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
                NumberPicker(
                  value: _currentValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) => setState(() => _currentValue = value),
                ),
              ],
            ),
          ],
        )
      ],
      backgroundColor: Colors.blue,
    );
  }
}
