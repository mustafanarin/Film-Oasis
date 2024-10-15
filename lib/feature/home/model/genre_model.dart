final class GenreModel {
  GenreModel({
    this.genres,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<Genre>? genres;
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