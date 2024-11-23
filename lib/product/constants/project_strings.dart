import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class ProjectStrings {
  static const String projectName = 'Film Oasis';

  // Home Page
  static const String showingTitle = 'Now showing';
  static const String popularTitle = 'Popular';
  static const String imbdText = '/10 IMDb';
  static const String buttonName = 'See more';
  static const String errorGenres = 'Error loading genres';
  static const String filmImagePath = 'https://image.tmdb.org/t/p/w500';
  static const String filmImageErrorPath = 'https://via.placeholder.com/150';
  static const String themeDarkText = 'Dark Theme';
  static const String languageText = 'English';
  static const String okText = 'Ok';
  static const String settings = 'Settings';

  // Detail Page
  static const String snackBarLinkError = 'An error occurred, please try again later.';
  static const String snacbarActionText = 'Close';
  static const String country = 'Country';
  static const String language = 'Language';
  static const String budget = 'Budget';
  static const String description = 'Description';
  static const String companies = 'Companies';

  // Search Page
  static const String appbarSearch = 'Film Search';
  static const String tfHintText = 'Search films...';
  static const String searchFilmText = 'Find the movie you want now 🔍';
  static const String noSearchText = 'No results found 🔍';

  // Favorites Page
  static const String favoriteText = 'Favorites';
  static const String noFoundFilm = 'No movies were found that match your search criteria';
  static const String noFavoriteFilm = "You haven't added any favorite movies yet";
  static const String cleanSearch = 'Clean Search';
  static const String forResults = 'for results';
}
