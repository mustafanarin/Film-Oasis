import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/page/see_more/see_more_page.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:flutter/material.dart';

mixin SeeMorePageMixin on State<SeeMorePage> {
  late final List<dynamic> films;
  List<Results>? nowShowing = [];
  List<MovieResult>? popular = [];
  bool isNowShowing = false;

  @override
  void initState() {
    super.initState();
    if (widget.movieList.isNotEmpty) {
      films = widget.movieList;
      
      // Does the films belong to NowShowing?
      if (films.first is Results) {
        isNowShowing = true;
      }
    }
  }

  String getPageTitle() {
    return isNowShowing ? ProjectStrings.showingTitle : ProjectStrings.popularTitle;
  }

  SliverGridDelegateWithFixedCrossAxisCount sliverGridDelegateWithFixedCrossAxisCount() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      childAspectRatio: 2 / 3.7,
      crossAxisSpacing: 15,
    );
  }
}
