import 'dart:developer';

import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCacheManager implements IThemeLanguageCacheManager<bool>{
  static const String _themeBox = 'theme_box';
  static const String _isDarkMode = 'is_dark_mode';

  @override
  Future<bool> load() async {
    try {
      final box = await Hive.openBox<bool>(_themeBox);
      return box.get(_isDarkMode, defaultValue: false) ?? false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<void> save(bool isDarkMode) async {
    final box = await Hive.openBox<bool>(_themeBox);
    await box.put(_isDarkMode, isDarkMode);
  }
}
