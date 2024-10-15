import 'dart:developer' show log;

import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowShowingNotifier extends AutoDisposeNotifier<NowShowingState> {
  late final IFilmService _service;

  @override
  NowShowingState build() {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return NowShowingState(nowShowingModel: NowShowingModel(), isLoading: false);
  }

  Future<void> getNowShowing() async {
    state = state.copyWith(isLoading: true);
    try {
      final nowShowing = await _service.getNowShowing();
      state = state.copyWith(
        nowShowingModel: nowShowing,
      );
    } catch (e) {
      log(e.toString());
      throw ProviderException(message: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
