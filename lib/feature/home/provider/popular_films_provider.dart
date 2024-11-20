import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_dio_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class PopularFilmsNotifier extends AutoDisposeNotifier<PopularFilmsState> {
  late final IFilmService _service;

  @override
  PopularFilmsState build() {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return PopularFilmsState(popularFilmsModel: PopularFilmModel(), isloading: false);
  }

  Future<void> getPopularFilms() async {
    state = state.copyWith(isloading: true);
    try {
      final films = await _service.getPopularFilms();
      state = state.copyWith(
        popularFilmsModel: films,
      );
    } catch (e) {
      log(e.toString());
      throw AppProviderDioException(message: e.toString());
    } finally {
      state = state.copyWith(isloading: false);
    }
  }
}
