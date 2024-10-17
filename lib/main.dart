import 'package:film_oasis/feature/home/view/detail_page.dart';
import 'package:film_oasis/feature/home/view/home_page.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/theme/app_theme.dart';
import 'package:film_oasis/product/utility/initialize/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await AppInitializer.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      theme: AppTheme.getLightTheme,
      home: const DetailPage(),
    );
  }
}
