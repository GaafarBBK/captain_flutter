import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // لا تنسَ استيراد google_fonts لاستخدام خط Changa

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الصفحة الرئيسية',
          style: GoogleFonts.changa(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة في الشبكة
            crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
            mainAxisSpacing: 10, // المسافة العمودية بين العناصر
          ),
          itemCount: 6, // عدد العناصر في الشبكة
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  // منطق عند النقر على العنصر
                },
                child: Center(
                  child: Text(
                    'عنصر ${index + 1}',
                    style: GoogleFonts.changa(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // منطق عند الضغط على الزر العائم
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'الملف الشخصي',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // منطق التنقل بين الأزرار
        },
      ),
    );
  }
}
