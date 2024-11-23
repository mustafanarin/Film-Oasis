import 'dart:developer';

import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageCacheManager implements IThemeLanguageCacheManager<bool> {
  static const String _languageBox = 'language_box';
  static const String _isTurkish = 'is_turkish';

  @override
  Future<bool> load() async {
    try {
      final box = await Hive.openBox<bool>(_languageBox);
      return box.get(_isTurkish, defaultValue: false) ?? false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<void> save(bool isTurkish) async {
    final box = await Hive.openBox<bool>(_languageBox);
    await box.put(_isTurkish, isTurkish);
  }
}
