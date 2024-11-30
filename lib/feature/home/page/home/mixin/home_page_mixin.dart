import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/page/home/home_page.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin HomePageMixin on ConsumerState<HomePage> {
  AsyncValue<NowShowingModel> get nowShowingState => ref.watch(AppProviderItems.nowShowingProvider);

  AsyncValue<PopularFilmModel> get popularFilmsState => ref.watch(AppProviderItems.popularFilmsProvider);

  bool get wantKeepAlive => true;

  void navigateToNowShowing(BuildContext context) {
    final movies = nowShowingState.value?.results ?? [];
    _navigateToSeeMorePage(context, movies);
  }

  void navigateToPopular(BuildContext context) {
    final movies = popularFilmsState.value?.results ?? [];
    _navigateToSeeMorePage(context, movies);
  }

  void _navigateToSeeMorePage(BuildContext context, List<dynamic> movieList) {
    context.pushRoute(SeeMoreRoute(movieList: movieList));
  }
}
