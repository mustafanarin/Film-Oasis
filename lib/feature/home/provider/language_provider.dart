import 'package:easy_localization/easy_localization.dart';
import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:film_oasis/product/constants/locale_constants.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<bool> {
  LanguageNotifier(this._cacheManager) : super(false) {
    // false = English, true = Turkish
    _loadLanguage();
  }

  final IThemeLanguageCacheManager<bool> _cacheManager;

  Future<void> _loadLanguage() async {
    state = await _cacheManager.load();
  }

  Future<void> toggleLanguage(BuildContext context) async {
    state = !state;
    await _cacheManager.save(state);

    if (!context.mounted) return;

    final locale = state ? LocaleConstants.trTR : LocaleConstants.enUS;
    await context.setLocale(locale);
  }
}
