// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:film_oasis/feature/favorite/page/favorites_page.dart' as _i2;
import 'package:film_oasis/feature/home/page/detail/detail_page.dart' as _i1;
import 'package:film_oasis/feature/home/page/home/home_page.dart' as _i3;
import 'package:film_oasis/feature/home/page/see_more/see_more_page.dart'
    as _i5;
import 'package:film_oasis/feature/search/page/search_page.dart' as _i4;
import 'package:film_oasis/feature/splash/splash_page.dart' as _i6;
import 'package:film_oasis/feature/tabbar/tabbar_page.dart' as _i7;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.DetailPage]
class DetailRoute extends _i8.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    required int filmId,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            filmId: filmId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return _i1.DetailPage(
        args.filmId,
        key: args.key,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    required this.filmId,
    this.key,
  });

  final int filmId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{filmId: $filmId, key: $key}';
  }
}

/// generated route for
/// [_i2.FavoritesPage]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.SearchPage();
    },
  );
}

/// generated route for
/// [_i5.SeeMorePage]
class SeeMoreRoute extends _i8.PageRouteInfo<SeeMoreRouteArgs> {
  SeeMoreRoute({
    required List<dynamic> movieList,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SeeMoreRoute.name,
          args: SeeMoreRouteArgs(
            movieList: movieList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SeeMoreRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeMoreRouteArgs>();
      return _i5.SeeMorePage(
        movieList: args.movieList,
        key: args.key,
      );
    },
  );
}

class SeeMoreRouteArgs {
  const SeeMoreRouteArgs({
    required this.movieList,
    this.key,
  });

  final List<dynamic> movieList;

  final _i9.Key? key;

  @override
  String toString() {
    return 'SeeMoreRouteArgs{movieList: $movieList, key: $key}';
  }
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}

/// generated route for
/// [_i7.TabbarPage]
class TabbarRoute extends _i8.PageRouteInfo<void> {
  const TabbarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TabbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabbarRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.TabbarPage();
    },
  );
}
