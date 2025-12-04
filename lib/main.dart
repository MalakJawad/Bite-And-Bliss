import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'providers/cart_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const BiteAndBlissApp(),
    ),
  );
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
    );
  }
}
