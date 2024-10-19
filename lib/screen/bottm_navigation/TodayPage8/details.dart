import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> workout;
  final Function(bool isChecked) onToggleCheck;

  DetailsPage({required this.workout, required this.onToggleCheck});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.workout['isChecked'];
  }

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked!;
      widget.onToggleCheck(isChecked!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.workout['name']!),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Image.asset(
                "assets/login.png",
                width: 400,
                height: 400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.workout['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.workout['description']!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'التاريخ: ${widget.workout['date']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                const SizedBox(width: 70),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF00A7E1),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      toggleCheck();
                    },
                    child: const Text(
                      'تم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
