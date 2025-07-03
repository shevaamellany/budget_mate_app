// lib/main.dart

import 'package:flutter/material.dart';
import 'package:budget_mate_app/screens/dashboard_screen.dart'; // Import halaman dashboard

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFC4E860), // Warna lemon
        scaffoldBackgroundColor: const Color(0xFFFDFDFD),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC4E860), // Warna AppBar
          foregroundColor: Colors.black, // Warna teks/icon
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFC4E860),
          foregroundColor: Colors.black,
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFC4E860),
          secondary: Colors.deepOrangeAccent,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
