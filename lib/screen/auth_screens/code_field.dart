import 'package:flutter/material.dart';
import 'package:captain11/screen/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ZipCodeForm extends StatefulWidget {
  @override
  _ZipCodeFormState createState() => _ZipCodeFormState();
}

class _ZipCodeFormState extends State<ZipCodeForm> {
  TextEditingController _zipCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _zipCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String zipCode = _zipCodeController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Zip Code Submitted: $zipCode')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'أ دخل هنا الكود الذي يصلك',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              PinCodeTextField(
                controller: _zipCodeController,
                appContext: context,
                length: 5,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                ),
                validator: (value) {
                  if (value == null || value.length != 5) {
                    return 'الرجاء أدخال الكود كامل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }
                  },
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
