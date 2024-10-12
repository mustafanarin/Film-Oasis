import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnvironmentVariables();
  }

  static Future<void> _loadEnvironmentVariables() async {
    try {
      await dotenv.load();
    } catch (e) {
      print('Error: .env failed to load: $e');
    }
  }
}