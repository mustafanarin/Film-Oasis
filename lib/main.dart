import 'package:easy_localization/easy_localization.dart';
import 'package:film_oasis/product/constants/locale_constants.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/navigate/app_router.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/theme/app_theme.dart';
import 'package:film_oasis/product/utility/initialize/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO model cache manager interface kullan
// TODO cache manager key enum oluştur
// TODO favorite bug

Future<void> main() async {
  await AppInitializer.initialize();
  runApp(
    EasyLocalization(
      supportedLocales: LocaleConstants.supportedLocales,
      path: LocaleConstants.path,
      fallbackLocale: LocaleConstants.enUS,
      startLocale: LocaleConstants.enUS,
      child: ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(AppProviderItems.themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.getLightTheme,
      darkTheme: AppTheme.getDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: _appRouter.config(),
    );
  }
}
