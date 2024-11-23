import 'dart:ui';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LocaleConstants {
  static const Locale enUS = Locale('en', 'US');
  static const Locale trTR = Locale('tr', 'TR');
  
  static const List<Locale> supportedLocales = [enUS, trTR];
  static const String path = 'assets/translations';
}