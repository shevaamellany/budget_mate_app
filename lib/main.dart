// lib/main.dart

import 'package:flutter/material.dart';
import 'package:budget_mate_app/screens/dashboard_screen.dart'; // Import halaman dashboard baru kita

void main() {
  runApp(const MyApp()); // Jalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetMate', // Judul aplikasi
     theme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFC4E860),
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFFDFDFD),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFC4E860),
    foregroundColor: Colors.black,
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
),

        useMaterial3: true, // Mengaktifkan Material Design 3
      ),
      home: const DashboardScreen(), // Halaman awal yang akan ditampilkan adalah DashboardScreen
      debugShowCheckedModeBanner: false, // Sembunyikan banner "DEBUG"
    );
  }
}
