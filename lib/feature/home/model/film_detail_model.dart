import 'package:hive/hive.dart';

part 'film_detail_model.g.dart';

@HiveType(typeId: 0)
final class FilmDetailModel extends HiveObject {
  FilmDetailModel({
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.originCountry,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.spokenLanguages,
    this.tagline,
    this.title,
    this.voteAverage,
  });

  factory FilmDetailModel.fromJson(Map<String, dynamic> json) {
    return FilmDetailModel(
      backdropPath: json['backdrop_path'] as String?,
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>?)?.map((e) => Genre.fromJson(
        e as Map<String, dynamic>,),).toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)?.cast<String>(),
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );
  }
  @HiveField(0)
  final String? backdropPath;

  @HiveField(1)
  final int? budget;

  @HiveField(2)
  final List<Genre>? genres;

  @HiveField(3)
  final String? homepage;

  @HiveField(4)
  final int? id;

  @HiveField(5)
  final List<String>? originCountry;

  @HiveField(6)
  final String? overview;

  @HiveField(7)
  final double? popularity;

  @HiveField(8)
  final String? posterPath;

  @HiveField(9)
  final List<ProductionCompany>? productionCompanies;

  @HiveField(10)
  final String? releaseDate;

  @HiveField(11)
  final List<SpokenLanguage>? spokenLanguages;

  @HiveField(12)
  final String? tagline;

  @HiveField(13)
  final String? title;

  @HiveField(14)
  final double? voteAverage;
}

@HiveType(typeId: 1)
final class Genre {
  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;
}

@HiveType(typeId: 2)
final class ProductionCompany {
  ProductionCompany({
    this.logoPath,
    this.name,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
    );
  }
  @HiveField(0)
  final String? logoPath;

  @HiveField(1)
  final String? name;
}

@HiveType(typeId: 3)
final class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String?,
    );
  }
  @HiveField(0)
  final String? englishName;
}
