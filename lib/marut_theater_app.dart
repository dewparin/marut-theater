import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marut_theater/home/home_screen.dart';

class MarutTheaterApp extends StatelessWidget {
  const MarutTheaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marut Theater',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
        ),
        indicatorColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
