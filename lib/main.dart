import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart'; // atau import lainnya sesuai struktur kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetMate',
      theme: ThemeData(
        primaryColor: const Color(0xFFC4E860), // Warna hijau lemon
        scaffoldBackgroundColor: const Color(0xFFFDFDFD), // warna latar belakang keseluruhan
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFC4E860),
          foregroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC4E860), // Warna AppBar
          foregroundColor: Colors.black, // Warna teks/icon
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
