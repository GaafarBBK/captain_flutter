import 'package:flutter/material.dart';
import 'package:captain11/helpers/consts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:captain11/screen/IntegerExample%20.dart';
import 'package:captain11/screen/auth_screens/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', ''),
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(),
        appBarTheme: AppBarTheme(
          backgroundColor: mainColor,
          titleTextStyle: GoogleFonts.changa(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            textStyle: GoogleFonts.changa(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.changa(),
          bodyMedium: GoogleFonts.changa(),
          displayLarge:
              GoogleFonts.changa(fontSize: 32, fontWeight: FontWeight.bold),
          titleLarge:
              GoogleFonts.changa(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
