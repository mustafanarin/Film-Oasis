final class NowShowingModel {
  NowShowingModel({
    this.results,
  });

  factory NowShowingModel.fromJson(Map<String, dynamic> json) {
    return NowShowingModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  
  List<Results>? results;
}

class Results {
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

  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  double? voteAverage; 
}
