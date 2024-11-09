// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilmDetailModelAdapter extends TypeAdapter<FilmDetailModel> {
  @override
  final int typeId = 0;

  @override
  FilmDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilmDetailModel(
      backdropPath: fields[0] as String?,
      budget: fields[1] as int?,
      genres: (fields[2] as List?)?.cast<Genre>(),
      homepage: fields[3] as String?,
      id: fields[4] as int?,
      originCountry: (fields[5] as List?)?.cast<String>(),
      overview: fields[6] as String?,
      popularity: fields[7] as double?,
      posterPath: fields[8] as String?,
      productionCompanies: (fields[9] as List?)?.cast<ProductionCompany>(),
      releaseDate: fields[10] as String?,
      spokenLanguages: (fields[11] as List?)?.cast<SpokenLanguage>(),
      tagline: fields[12] as String?,
      title: fields[13] as String?,
      voteAverage: fields[14] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, FilmDetailModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.budget)
      ..writeByte(2)
      ..write(obj.genres)
      ..writeByte(3)
      ..write(obj.homepage)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.originCountry)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.productionCompanies)
      ..writeByte(10)
      ..write(obj.releaseDate)
      ..writeByte(11)
      ..write(obj.spokenLanguages)
      ..writeByte(12)
      ..write(obj.tagline)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 1;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompanyAdapter extends TypeAdapter<ProductionCompany> {
  @override
  final int typeId = 2;

  @override
  ProductionCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompany(
      logoPath: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompany obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.logoPath)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguageAdapter extends TypeAdapter<SpokenLanguage> {
  @override
  final int typeId = 3;

  @override
  SpokenLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguage(
      englishName: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.englishName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
