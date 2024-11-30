import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/favorite/state/favorite_state.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/provider/film_detail_provider.dart';
import 'package:film_oasis/feature/home/provider/language_provider.dart';
import 'package:film_oasis/feature/home/provider/now_showing_provider.dart';
import 'package:film_oasis/feature/home/provider/popular_films_provider.dart';
import 'package:film_oasis/feature/home/provider/theme_provider.dart';
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
  // Service
  static final filmServiceProvider = Provider<IFilmService>((ref) => FilmService());

  // Home Page
  static final nowShowingProvider = AutoDisposeAsyncNotifierProvider<NowShowingNotifier, NowShowingModel>(
    NowShowingNotifier.new,
  );

  static final genreProvider = FutureProvider<GenreModel>((ref) async {
    final filmService = ref.watch(AppProviderItems.filmServiceProvider);
    return filmService.getGenres();
  });

  static final popularFilmsProvider = AutoDisposeAsyncNotifierProvider<PopularFilmsNotifier, PopularFilmModel>(
    PopularFilmsNotifier.new,
  );

  // Detail Page
  static final filmDetailProvider = AutoDisposeAsyncNotifierProvider<FilmDetailNotifier, FilmDetailModel>(
    FilmDetailNotifier.new,
  );

  // Search Page
  static final searchProvider = AutoDisposeNotifierProvider<SearchNotifier, SearchState>(
    SearchNotifier.new,
  );

  // Favorite Page
  static final modelCacheProvider = Provider<IModelCacheManager<FilmDetailModel>>((ref) {
    return ModelCacheManager();
  });

  static final favoriteProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
    return FavoriteNotifier(ref: ref);
  });

  // Language
  static final languageCacheProvider = Provider<IThemeLanguageCacheManager<bool>>((ref) {
    return LanguageCacheManager();
  });

  static final languageProvider = StateNotifierProvider<LanguageNotifier, bool>((ref) {
    final cacheManager = ref.watch(languageCacheProvider);
    return LanguageNotifier(cacheManager);
  });

  // Theme
  static final themeCacheProvider = Provider<IThemeLanguageCacheManager<bool>>((ref) {
    return ThemeCacheManager();
  });

  static final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
    final cacheManager = ref.watch(themeCacheProvider);
    return ThemeNotifier(cacheManager);
  });
}
