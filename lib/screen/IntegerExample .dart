import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class MeasurementPicker extends StatefulWidget {
  @override
  _MeasurementPickerState createState() => _MeasurementPickerState();
}

class _MeasurementPickerState extends State<MeasurementPicker> {
  int _height = 170;
  int _weight = 70;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('اختر الطول والوزن'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الطول: $_height سم',
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                //  SizedBox(height: 70),
                NumberPicker(
                  value: _height,
                  minValue: 100,
                  maxValue: 250,
                  step: 1,
                  itemHeight: 60,
                  axis: Axis.vertical,
                  onChanged: (value) {
                    setState(() {
                      _height = value;
                    });
                  },
                  selectedTextStyle:
                      const TextStyle(color: Colors.blue, fontSize: 22),
                  textStyle: const TextStyle(color: Colors.grey),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   const SizedBox(height: 370),
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text('التالي: اختر الوزن'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الوزن: $_weight كغ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                NumberPicker(
                  value: _weight,
                  minValue: 30,
                  maxValue: 200,
                  step: 1,
                  itemHeight: 50,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() {
                      _weight = value;
                    });
                  },
                  selectedTextStyle:
                      TextStyle(color: Colors.blue, fontSize: 22),
                  textStyle: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('السابق: اختر الطول'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
