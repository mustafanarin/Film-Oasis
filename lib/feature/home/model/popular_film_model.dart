final class PopularFilmModel {
  PopularFilmModel({
    this.results,
  });

  factory PopularFilmModel.fromJson(Map<String, dynamic> json) {
    return PopularFilmModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<MovieResult>? results;
}

final class MovieResult {
  MovieResult({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );
  }

  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalTitle;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final double? voteAverage;
}