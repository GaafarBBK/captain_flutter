import 'package:captain11/helpers/notifications.dart';
import 'package:captain11/helpers/random_functions.dart';
import 'package:captain11/helpers/search.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:captain11/screen/bottm_navigation/StorePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weight});

  int weight;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _stepCountValue = '0';
  late Stream<StepCount> _stepCountStream;

  int _selectedIndex = 2;
  int _currentValue = 3;
  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCountValue = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    setState(() {
      _stepCountValue = 'Error: $error';
    });
  }

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
          MaterialPageRoute(builder: (context) => HomePage(weight: widget.weight,)),
        );
      }
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.3,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.blue,
                          width: 5.0,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.directions_walk,
                              color: Colors.blue, size: 30),
                          const SizedBox(height: 5),
                          Text(
            '$_stepCountValue',
            style: TextStyle(fontSize: 20),
          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red,
                      width: 1.3,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.red,
                          width: 5.0,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_fire_department,
                              color: Colors.red, size: 30),
                          const SizedBox(height: 5),
                  Text(
            calculateCaloriesBurned(int.parse(_stepCountValue), widget.weight.toDouble()).toString(),
            style: const TextStyle(fontSize: 20),
          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
                color: Colors.blue.withOpacity(1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodayPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.3,
                          ),
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(8),
                        //   border: Border.all(color: Colors.black),
                        //   color: Colors.white,
                        // ),
                        height: 50,
                        width: 300,
                        alignment: Alignment.center,
                        child: Text(
                          'تدريب اليوم المتبقي',
                          style: GoogleFonts.changa(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodayPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.3,
                          ),
                          color: Colors.white,
                        ),
                        height: 50,
                        width: 300,
                        alignment: Alignment.center,
                        child: Text(
                          'وجبة اليوم',
                          style: GoogleFonts.changa(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
PreferredSizeWidget HomeAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'كابتن',
      style: GoogleFonts.changa(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    actions: [
      Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ],
    backgroundColor: Colors.blue,
);
}
