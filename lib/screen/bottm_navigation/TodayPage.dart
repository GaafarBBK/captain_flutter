import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:captain11/screen/bottm_navigation/HomePage.dart';
import 'package:captain11/screen/bottm_navigation/StorePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage8/details.dart';

class TodayPage extends StatefulWidget {
  TodayPage({super.key});

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  int _selectedIndex = 1;

  List<Map<String, dynamic>> workouts = [
    {
      'name': '1أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/cardio.png',
      'date': '2024-10-19',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/yoga.png',
      'date': '2024-10-21',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'ppppp': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
    {
      'name': 'أسم التدريب',
      'description1': 'وصف التمرين',
      'description': 'الوزن و العدادت',
      'image': 'assets/weights.png',
      'date': '2024-10-20',
      'isChecked': false,
    },
  ];

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              height: 200,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    DatePicker(
                      DateTime.now(),
                      height: 90,
                      width: 70,
                      initialSelectedDate: DateTime.now(),
                      locale: "ar",
                      selectionColor: Colors.black54,
                      selectedTextColor: Colors.white,
                      dayTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      monthTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      dateTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue,
                      tabs: [
                        Text('جدول التمرين '),
                        Text('النظام الغذاء '),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          buildWorkoutCards(context),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWorkoutCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    workout: workouts[index],
                    onToggleCheck: (bool isChecked) {
                      setState(() {
                        workouts[index]['isChecked'] = isChecked;
                      });
                    },
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/login.png",
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workouts[index]['name']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            workouts[index]['description']!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: workouts[index]['isChecked'],
                      onChanged: (bool? value) {
                        setState(() {
                          
                          workouts[index]['isChecked'] = value!;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
