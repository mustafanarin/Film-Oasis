import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/page/home/home_page.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin HomePageMixin on ConsumerState<HomePage> {
  NowShowingState get nowShowingState => ref.watch(AppProviderItems.nowShowingProvider);
  PopularFilmsState get popularFilmsState => ref.watch(AppProviderItems.popularFilmsProvider);

  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(AppProviderItems.nowShowingProvider.notifier).getNowShowing();
      ref.read(AppProviderItems.popularFilmsProvider.notifier).getPopularFilms();
    });
  }

  void navigateToNowShowing(BuildContext context) {
    final movies = nowShowingState.nowShowingModel.results ?? [];
    _navigateToSeeMorePage(context, movies);
  }

  void navigateToPopular(BuildContext context) {
    final movies = popularFilmsState.popularFilmsModel.results ?? [];
    _navigateToSeeMorePage(context, movies);
  }

  void _navigateToSeeMorePage(BuildContext context, List<dynamic> movieList) {
    context.pushRoute(SeeMoreRoute(movieList: movieList));
  }
}
