final class FilmDetailModel {
  FilmDetailModel({
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.originCountry,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
  });

  factory FilmDetailModel.fromJson(Map<String, dynamic> json) {
    return FilmDetailModel(
      backdropPath: json['backdrop_path'] as String?,
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)?.cast<String>(),
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );
  }

  final String? backdropPath;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final List<String>? originCountry;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
}

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

  final int? id;
  final String? name;
}

final class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;
}

final class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }

  final String? iso31661;
  final String? name;
}

final class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );
  }

  final String? englishName;
  final String? iso6391;
  final String? name;
}