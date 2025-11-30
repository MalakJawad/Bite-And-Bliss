import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

class BiteAndBlissApp extends StatelessWidget {
  const BiteAndBlissApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bite & Bliss',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
