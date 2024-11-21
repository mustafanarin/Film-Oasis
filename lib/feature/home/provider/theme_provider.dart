import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  static const String _themeBox = 'theme_box';
  static const String _isDarkMode = 'is_dark_mode';

  Future<void> _loadTheme() async {
    final box = await Hive.openBox<bool>(_themeBox);
    state = box.get(_isDarkMode, defaultValue: false) ?? false;
  }

  Future<void> toggleTheme() async {
    final box = await Hive.openBox<bool>(_themeBox);
    state = !state;
    await box.put(_isDarkMode, state);
  }
}