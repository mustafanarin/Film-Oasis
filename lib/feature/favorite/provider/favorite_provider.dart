import 'package:film_oasis/feature/favorite/state/favorite_state.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/cache/model_cache_manager.dart';
import 'package:film_oasis/product/utility/exception/provider_hive_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = AutoDisposeNotifierProvider<FavoriteNotifier, FavoriteState>(() {
  return FavoriteNotifier();
});

class FavoriteNotifier extends AutoDisposeNotifier<FavoriteState> {
  late final ModelCacheManager _cacheManager;

  @override
  FavoriteState build() {
    _cacheManager = ModelCacheManager();
    _initFavorites();
    return FavoriteState([], false);
  }

  Future<void> _initFavorites() async {
    await getFavorite();
  }

  Future<void> toggleFavorite(FilmDetailModel model) async {
    state = state.copyWith(isLoading: true);
    try {
      await _cacheManager.toggleFavorite(model);
      await getFavorite();
    } catch (e) {
      throw ProviderHiveException(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getFavorite() async {
    state = state.copyWith(isLoading: true);
    try {
      final favorites = await _cacheManager.getFavorites();
      state = state.copyWith(model: favorites);
    } catch (e) {
      throw ProviderHiveException(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
