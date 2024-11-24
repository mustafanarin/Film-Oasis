import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/cache/interface/i_model_cache_manager.dart';
import 'package:film_oasis/product/constants/cache_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ModelCacheManager implements IModelCacheManager<FilmDetailModel> {
  LazyBox<FilmDetailModel>? _box;

  Future<LazyBox<FilmDetailModel>?> _getBox() async {
    if (_box != null) return _box;
    _box = await Hive.openLazyBox<FilmDetailModel>(CacheConstants.modelBoxName);
    return _box;
  }

  @override
  Future<void> toggleFavorite(FilmDetailModel model) async {
    final box = await _getBox();

    if (box!.containsKey(model.id)) {
      await box.delete(model.id);
    } else {
      await box.put(model.id, model);
    }
  }

  @override
  Future<List<FilmDetailModel>?> getFavorites() async {
    final box = await _getBox();
    if (box == null) return null;

    final favorites = <FilmDetailModel>[];

    for (final key in box.keys) {
      final value = await box.get(key);
      if (value != null) {
        favorites.add(value);
      }
    }
    return favorites;
  }
}
