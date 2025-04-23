import 'package:easy_localization/easy_localization.dart';
import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:film_oasis/product/constants/locale_constants.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<bool> {
  LanguageNotifier(this._cacheManager, this._ref) : super(false) {
    // false = English, true = Turkish
    _loadLanguage();
  }

  final IThemeLanguageCacheManager<bool> _cacheManager;
  final Ref _ref; 

  Future<void> _loadLanguage() async {
    state = await _cacheManager.load();
  }

  Future<void> toggleLanguage(BuildContext context) async {
    final newState = !state;

    state = newState;
    await _cacheManager.save(newState);

    if (!context.mounted) return;

    final locale = newState ? LocaleConstants.trTR : LocaleConstants.enUS;

    await context.setLocale(locale);

    // Force UI refresh by incrementing the refresh trigger
    // This ensures all listeners rebuild even if the actual state value didn't change
    _ref.read(AppProviderItems.refreshTriggerProvider.notifier).state++;
  }
}
