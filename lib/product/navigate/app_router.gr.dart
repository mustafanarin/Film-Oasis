// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:film_oasis/feature/home/view/detail_page.dart' as _i1;
import 'package:film_oasis/feature/home/view/home_page.dart' as _i2;
import 'package:film_oasis/feature/home/view/see_more_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.DetailPage]
class DetailRoute extends _i4.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    required int filmId,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            filmId: filmId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i4.PageInfo page = _i4.PageInfo(
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{filmId: $filmId, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.SeeMorePage]
class SeeMoreRoute extends _i4.PageRouteInfo<SeeMoreRouteArgs> {
  SeeMoreRoute({
    required List<dynamic> movieList,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SeeMoreRoute.name,
          args: SeeMoreRouteArgs(
            movieList: movieList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SeeMoreRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeMoreRouteArgs>();
      return _i3.SeeMorePage(
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'SeeMoreRouteArgs{movieList: $movieList, key: $key}';
  }
}
