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

  List<Genre>? genres;
}

class Genre {
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

  int? id;
  String? name;
}