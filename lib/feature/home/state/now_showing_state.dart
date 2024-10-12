import 'package:film_oasis/feature/home/model/now_showing_model.dart';

final class NowShowingState {
  NowShowingState({required this.nowShowingModel, required this.isLoading});

  final NowShowingModel nowShowingModel;
  final bool isLoading;

  

  NowShowingState copyWith({
    NowShowingModel? nowShowingModel,
    bool? isLoading,
  }) {
    return NowShowingState(
      nowShowingModel: nowShowingModel ?? this.nowShowingModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
