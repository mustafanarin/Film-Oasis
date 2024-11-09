import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManager {
  static const String _boxName = 'favorite_film_box';

  Box<FilmDetailModel>? _box;

  Future<Box<FilmDetailModel>?> _getBox() async {
    if (_box != null) return _box;
    _box = await Hive.openBox<FilmDetailModel>(_boxName);
    return _box;
  }

  Future<void> toggleFavorite(FilmDetailModel model) async {
    final box = await _getBox();

    if (box!.containsKey(model.id)) {
      await box.delete(model.id);
    } else {
      await box.put(model.id, model);
    }
  }

  Future<List<FilmDetailModel>?> getFavorites() async {
    final box = await _getBox();
    return box?.values.toList();
  }
}
