import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/navigate/app_router.dart';
import 'package:film_oasis/product/theme/app_theme.dart';
import 'package:film_oasis/product/utility/initialize/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await AppInitializer.initialize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      theme: AppTheme.getLightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
