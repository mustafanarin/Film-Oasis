import 'dart:async';
import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_dio_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class FilmDetailNotifier extends AutoDisposeAsyncNotifier<FilmDetailModel> {
  late final IFilmService _service;

  @override
  FutureOr<FilmDetailModel> build() {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return FilmDetailModel(); // Initial empty model
  }

  Future<void> getFilmDetail(int filmId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        return await _service.getFilmDetail(filmId);
      } catch (e) {
        log(e.toString());
        throw AppProviderDioException(message: e.toString());
      }
    });
  }
}
