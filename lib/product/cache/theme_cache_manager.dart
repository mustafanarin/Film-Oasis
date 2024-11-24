import 'dart:developer';

import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:film_oasis/product/constants/cache_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCacheManager implements IThemeLanguageCacheManager<bool>{

  @override
  Future<bool> load() async {
    try {
      final box = await Hive.openBox<bool>(CacheConstants.themeBox);
      return box.get(CacheConstants.isDarkMode, defaultValue: false) ?? false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<void> save(bool isDarkMode) async {
    final box = await Hive.openBox<bool>(CacheConstants.themeBox);
    await box.put(CacheConstants.isDarkMode, isDarkMode);
  }
}
