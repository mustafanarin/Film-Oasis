import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier(this._cacheManager) : super(false) {
    _loadTheme();
  }

  final IThemeLanguageCacheManager<bool> _cacheManager;

  Future<void> _loadTheme() async {
    state = await _cacheManager.load();
  }

  Future<void> toggleTheme() async {
    state = !state;
    await _cacheManager.save(state);
  }
}
