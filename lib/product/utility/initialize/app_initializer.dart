import 'package:easy_localization/easy_localization.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _loadEnvironmentVariables();
    await Hive.initFlutter();

    Hive
      ..registerAdapter(FilmDetailModelAdapter())
      ..registerAdapter(GenreAdapter())
      ..registerAdapter(ProductionCompanyAdapter())
      ..registerAdapter(SpokenLanguageAdapter());
  }

  static Future<void> _loadEnvironmentVariables() async {
    try {
      await dotenv.load();
    } catch (e) {
      print('Error: .env failed to load: $e');
    }
  }
}
