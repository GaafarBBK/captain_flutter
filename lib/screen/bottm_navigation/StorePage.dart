import 'package:captain11/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:captain11/screen/stab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/screen/bottm_navigation/HomePage.dart';
import 'package:captain11/screen/bottm_navigation/TodayPage.dart';
import 'package:captain11/providers/auth_provider.dart';
import 'package:provider/provider.dart'; // Import the auth provider


class StorePage extends StatefulWidget {
  const StorePage({super.key});
  final int weight = 70;
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _genderController = TextEditingController();
  // final TextEditingController _ageController = TextEditingController();




@override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false)
        .getUser()
        .then((userdata) {
          if(userdata != null) {
             _nameController.text = userdata!.name;
      if(userdata!.phoneNumber != null) {
        _phoneController.text = userdata!.phoneNumber!;
      } else {
        _phoneController.text = '';
      };
      // _ageController.text = userdata.age.toString();
      // _genderController.text = userdata.gender;
      _emailController.text = userdata.email;

      setState(() {
        
      });
            
          }
     
    });
    super.initState();
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
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.blue,
                      //   shape: BoxShape.circle,
                      // ),
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 65,
                          backgroundImage: AssetImage('assets/login.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _nameController.text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _phoneController.text,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                     Text(
                      _emailController.text,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                    //  Text(
                    //   _ageController.text,
                    //   style: const TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.normal,
                    //       color: Colors.black54),
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
         
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StepCounterScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                  color: Colors.blue,
                ),
                height: 50,
                width: 300,
                alignment: Alignment.center,
                child: const Text(
                  'تدريب اليوم',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ProfileDetailRow extends StatelessWidget {
//   final String title;
//   final String value;

//   const ProfileDetailRow({
//     required this.title,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           const SizedBox(width: 16),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.grey[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

PreferredSizeWidget StoreAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      '',
      style: GoogleFonts.changa(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
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
