import 'package:film_oasis/feature/favorite/state/favorite_state.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/cache/interface/i_model_cache_manager.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_hive_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier({
    required Ref ref,
  }) : super(FavoriteState([], false)) {
    _cacheManager = ref.read(AppProviderItems.modelCacheProvider);
    _initFavorites();
  }

  late final IModelCacheManager<FilmDetailModel> _cacheManager;

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
