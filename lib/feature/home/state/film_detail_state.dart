import 'package:film_oasis/feature/home/model/film_detail_model.dart';

class FilmDetailState {
  FilmDetailState({required this.filmDetailModel, required this.isLoading});


  final FilmDetailModel filmDetailModel;
  final bool isLoading;
  
  FilmDetailState copyWith({
    FilmDetailModel? filmDetailModel,
    bool? isLoading,
  }) {
    return FilmDetailState(
      filmDetailModel: filmDetailModel ?? this.filmDetailModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
