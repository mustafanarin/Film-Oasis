import 'package:film_oasis/feature/home/view/home_page.dart';
import 'package:film_oasis/product/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Film Oasis',
      theme: AppTheme.getLightTheme,
      home: HomePage(),
    );
  }
}
