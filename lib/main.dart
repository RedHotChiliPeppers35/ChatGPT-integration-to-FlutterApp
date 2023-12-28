import 'package:flutter/material.dart';
import 'package:flutter_application_2/enterance.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green.shade100,
            titleTextStyle: GoogleFonts.montserrat(
                color: Colors.green.shade900,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: StartPage());
  }
}
