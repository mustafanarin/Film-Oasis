import 'dart:developer' show log;

import 'package:film_oasis/feature/search/model/search_model.dart';
import 'package:film_oasis/feature/search/state/search_state.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/utility/exception/provider_dio_exception.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends AutoDisposeNotifier<SearchState> {
  late final IFilmService _service;

  @override
  SearchState build() {
    _service = ref.watch(AppProviderItems.filmServiceProvider);
    return SearchState(searchModel: SearchModel(), isLoading: false);
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;

    state = state.copyWith(isLoading: true);
    try {
      final result = await _service.searchMovies(query);

      // Filter movies after 1980 and sort by release date
      if (result.results != null) {
        var filteredResults = result.results!.where((movie) {
          if (movie.releaseDate == null) return false;
          try {
            final releaseDate = DateTime.parse(movie.releaseDate!);
            return releaseDate.year > 1980;
          } catch (e) {
            return false;
          }
        }).toList();

        // Sort from newest to oldest
        filteredResults.sort((a, b) {
          final dateA = DateTime.parse(a.releaseDate ?? '1900-01-01');
          final dateB = DateTime.parse(b.releaseDate ?? '1900-01-01');
          return dateB.compareTo(dateA);
        });

        final filteredModel = SearchModel(
          page: result.page,
          results: filteredResults,
          totalPages: result.totalPages,
          totalResults: filteredResults.length,
        );

        state = state.copyWith(searchModel: filteredModel);
      } else {
        state = state.copyWith(searchModel: result);
      }
    } catch (e) {
      log(e.toString());
      throw AppProviderDioException(message: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void clearSearch() {
    state = state.copyWith(searchModel: SearchModel(), isLoading: false);
  }
}
