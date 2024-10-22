import 'package:film_oasis/feature/search/model/search_model.dart';

final class SearchState {
  SearchState({
    required this.searchModel,
    required this.isLoading,
  });

  final SearchModel searchModel;
  final bool isLoading;

  SearchState copyWith({
    SearchModel? searchModel,
    bool? isLoading,
  }) {
    return SearchState(
      searchModel: searchModel ?? this.searchModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}