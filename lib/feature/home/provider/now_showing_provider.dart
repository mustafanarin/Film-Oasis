import 'dart:async';
import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_dio_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class NowShowingNotifier extends AutoDisposeAsyncNotifier<NowShowingModel> {
  late final IFilmService _service;

  @override
  FutureOr<NowShowingModel> build() async {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return getNowShowing();
  }

  Future<NowShowingModel> getNowShowing() async {
    try {
      return await _service.getNowShowing();
    } catch (e) {
      log(e.toString());
      throw AppProviderDioException(message: e.toString());
    }
  }
}
