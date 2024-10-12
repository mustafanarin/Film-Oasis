import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/product/utility/exception/dio_excepiton.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowShowingProvider = AutoDisposeNotifierProvider<NowShowingNotifier, NowShowingState>(
  (){  return NowShowingNotifier();
  });

class NowShowingNotifier extends AutoDisposeNotifier<NowShowingState> {
  late final IFilmService _service;

  @override
  NowShowingState build() {
    _service = ref.watch(filmServiceProvider);
    return NowShowingState(nowShowingModel: NowShowingModel(), isLoading: false);
  }

  Future<void> getNowShowing() async {
    state = state.copyWith(isLoading: true);
    try {
      final nowShowing = await _service.getNowShowing();
      state = NowShowingState(nowShowingModel: nowShowing, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print(e);
      throw MyDioException(e.toString());
    }
  }
}