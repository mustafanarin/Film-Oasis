import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class ProjectStrings {
  static const String projectName = 'Film Oasis';

  // Home Page
  static String get showingTitle => 'home.showing_title'.tr();
  static String get popularTitle => 'home.popular_title'.tr();
  static String get imbdText => 'home.imdb_text'.tr();
  static String get buttonName => 'home.button_name'.tr();
  static String get errorGenres => 'home.error_genres'.tr();
  static String get filmImagePath => 'constants.film_image_path'.tr();
  static String get filmImageErrorPath => 'constants.film_image_error_path'.tr();
  static String get themeDarkText => 'home.theme_dark_text'.tr();
  static String get languageText => 'home.language_text'.tr();
  static String get okText => 'home.ok_text'.tr();
  static String get settings => 'home.settings'.tr();
  static String get tryAgain => 'home.tryAgain'.tr();
  static String get dontLoadData => 'home.dontLoadData'.tr();

  // Detail Page
  static String get detailTitle => 'detail.detail_title'.tr();
  static String get snackBarLinkError => 'detail.snackbar_link_error'.tr();
  static String get snacbarActionText => 'detail.snackbar_action_text'.tr();
  static String get country => 'detail.country'.tr();
  static String get language => 'detail.language'.tr();
  static String get budget => 'detail.budget'.tr();
  static String get description => 'detail.description'.tr();
  static String get companies => 'detail.companies'.tr();

  // Search Page
  static String get appbarSearch => 'search.appbar_search'.tr();
  static String get tfHintText => 'search.tf_hint_text'.tr();
  static String get searchFilmText => 'search.search_film_text'.tr();

  // Favorites Page
  static String get favoriteText => 'favorites.favorite_text'.tr();
  static String get noFoundFilm => 'favorites.no_found_film'.tr();
  static String get noFavoriteFilm => 'favorites.no_favorite_film'.tr();
  static String get cleanSearch => 'favorites.clean_search'.tr();
  static String get forResults => 'favorites.for_results'.tr();
}
