import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const BiteAndBlissApp());
}

class BiteAndBlissApp extends StatelessWidget {
  const BiteAndBlissApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bite & Bliss',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const HomePage(),
      // Add simple scroll behavior for smooth mobile feel
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
