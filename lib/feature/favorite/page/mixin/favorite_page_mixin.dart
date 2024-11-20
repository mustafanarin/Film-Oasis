import 'package:film_oasis/feature/favorite/page/favorites_page.dart';
import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin FavoritePageMixin on ConsumerState<FavoritesPage> {
  bool isSearching = false;
  String searchQuery = '';
  late final TextEditingController searchController;
  late final FocusNode searchFocusNode;
  late final AnimationController animationController;
  static const _animationDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    animationController = AnimationController(
      vsync: this as TickerProvider,
      duration: _animationDuration,
    );

    Future.microtask(() {
      ref.read(favoriteProvider.notifier).getFavorite();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (isSearching) {
        animationController.forward();
        searchFocusNode.requestFocus();
      } else {
        animationController.reverse();
        searchQuery = '';
        searchController.clear();
        searchFocusNode.unfocus();
      }
    });
  }

  void updateSearchQuery(String value) {
    setState(() {
      searchQuery = value;
    });
  }

  void clearSearch() {
    searchController.clear();
    updateSearchQuery('');
  }

  List<FilmDetailModel> filterFavorites(List<FilmDetailModel> favorites) {
    if (searchQuery.isEmpty) return favorites;

    return favorites.where((film) {
      final title = film.title?.toLowerCase() ?? '';
      final query = searchQuery.toLowerCase();

      return title.contains(query);
    }).toList();
  }
}
