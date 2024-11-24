import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/favorite/state/favorite_state.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/provider/film_detail_provider.dart';
import 'package:film_oasis/feature/home/provider/language_provider.dart';
import 'package:film_oasis/feature/home/provider/now_showing_provider.dart';
import 'package:film_oasis/feature/home/provider/popular_films_provider.dart';
import 'package:film_oasis/feature/home/provider/theme_provider.dart';
import 'package:film_oasis/feature/home/state/film_detail_state.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/feature/search/provider/search_provider.dart';
import 'package:film_oasis/feature/search/state/search_state.dart';
import 'package:film_oasis/product/cache/interface/i_model_cache_manager.dart';
import 'package:film_oasis/product/cache/interface/i_theme_language_cache_manager.dart';
import 'package:film_oasis/product/cache/language_cache_manager.dart';
import 'package:film_oasis/product/cache/model_cache_manager.dart';
import 'package:film_oasis/product/cache/theme_cache_manager.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppProviderItems {
  static final filmServiceProvider = Provider<IFilmService>((ref) => FilmService());

  static final nowShowingProvider = AutoDisposeNotifierProvider<NowShowingNotifier, NowShowingState>(() {
    return NowShowingNotifier();
  });

  static final genreProvider = FutureProvider<GenreModel>((ref) async {
    final filmService = ref.watch(AppProviderItems.filmServiceProvider);
    return filmService.getGenres();
  });

  static final popularFilmsProvider = AutoDisposeNotifierProvider<PopularFilmsNotifier, PopularFilmsState>(() {
    return PopularFilmsNotifier();
  });

  static final filmDetailProvider = AutoDisposeNotifierProvider<FilmDetailNotifier, FilmDetailState>(() {
    return FilmDetailNotifier();
  });

  static final searchProvider = AutoDisposeNotifierProvider<SearchNotifier, SearchState>(
    SearchNotifier.new,
  );

  static final languageCacheProvider = Provider<IThemeLanguageCacheManager<bool>>((ref) {
    return LanguageCacheManager();
  });

  static final languageProvider = StateNotifierProvider<LanguageNotifier, bool>((ref) {
    final cacheManager = ref.watch(languageCacheProvider);
    return LanguageNotifier(cacheManager);
  });

  static final themeCacheProvider = Provider<IThemeLanguageCacheManager<bool>>((ref) {
    return ThemeCacheManager();
  });

  static final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
    final cacheManager = ref.watch(themeCacheProvider);
    return ThemeNotifier(cacheManager);
  });

  static final modelCacheProvider = Provider<IModelCacheManager<FilmDetailModel>>((ref) {
    return ModelCacheManager();
  });

  static final favoriteProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
    return FavoriteNotifier(ref: ref);
  });
}
