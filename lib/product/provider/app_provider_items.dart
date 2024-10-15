import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/provider/now_showing_provider.dart';
import 'package:film_oasis/feature/home/provider/popular_films_provider.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
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
}
