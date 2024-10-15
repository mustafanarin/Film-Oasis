import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/state/film_detail_state.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilmDetailNotifier extends AutoDisposeNotifier<FilmDetailState> {
  late final IFilmService _service;

  @override
  FilmDetailState build() {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return FilmDetailState(filmDetailModel: FilmDetailModel(), isLoading: false);
  }

  Future<void> getFilmDetail(int filmId) async {
    state = state.copyWith(isLoading: true);
    try {
      final filmDetail = await _service.getFilmDetail(filmId);

      state = state.copyWith(filmDetailModel: filmDetail);
    } catch (e) {
      log(e.toString());
      throw AppProviderException(message: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
