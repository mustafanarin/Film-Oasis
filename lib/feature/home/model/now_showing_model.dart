final class NowShowingModel {
  NowShowingModel({
    this.results,
  });

  factory NowShowingModel.fromJson(Map<String, dynamic> json) {
    return NowShowingModel(
      results: (json['results'] as List<dynamic>?)?.map((e) => Results.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  final List<Results>? results;
}

final class Results {
  Results({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.voteAverage,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );
  }

  final String? backdropPath;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
}
