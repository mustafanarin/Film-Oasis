import 'package:film_oasis/feature/home/provider/theme_provider.dart';
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

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      theme: AppTheme.getLightTheme,
      darkTheme: AppTheme.getDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: _appRouter.config(),
    );
  }
}
