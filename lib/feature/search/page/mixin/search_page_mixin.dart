import 'dart:async';

import 'package:film_oasis/feature/search/page/search_page.dart';
import 'package:film_oasis/product/constants/enum/app_duration.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin SearchPageMixin on ConsumerState<SearchPage> {
  late final TextEditingController searchController;
  Timer? _debounceTimer;
  static final _debounceDuration = Duration(milliseconds: AppDuration.mediumMilliSeconds.value);

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(_debounceDuration, () {
      if (query.isNotEmpty) {
        ref.watch(AppProviderItems.searchProvider.notifier).searchMovies(query);
      } else {
        ref.watch(AppProviderItems.searchProvider.notifier).clearSearch();
      }
    });
  }

  void clearSearch() {
    searchController.clear();
    ref.read(AppProviderItems.searchProvider.notifier).clearSearch();
  }
}
