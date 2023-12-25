import 'package:flutter/material.dart';

import 'Screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(), // textTheme
          fontFamily: GoogleFonts.raleway().fontFamily,
          primaryColor: Colors.amber,
          primarySwatch: Colors.amber,
          useMaterial3: true),
    );
  }
}
