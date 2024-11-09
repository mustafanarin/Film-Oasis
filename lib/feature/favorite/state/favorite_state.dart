// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:film_oasis/feature/home/model/film_detail_model.dart';

class FavoriteState {
  FavoriteState(this.model, this.isLoading);

  final List<FilmDetailModel>? model;
  final bool isLoading;

  

  FavoriteState copyWith({
    List<FilmDetailModel>? model,
    bool? isLoading,
  }) {
    return FavoriteState(
      model ?? this.model,
      isLoading ?? this.isLoading,
    );
  }
}
