import 'dart:async';
import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_dio_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class PopularFilmsNotifier extends AutoDisposeAsyncNotifier<PopularFilmModel> {
  late final IFilmService _service;

  @override
  FutureOr<PopularFilmModel> build() async {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return getPopularFilms();
  }

  Future<PopularFilmModel> getPopularFilms() async {
    try {
      return await _service.getPopularFilms();
    } catch (e) {
      log(e.toString());
      throw AppProviderDioException(message: e.toString());
    }
  }
}