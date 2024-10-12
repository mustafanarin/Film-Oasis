import 'package:film_oasis/feature/home/model/popular_film_model.dart';

final class PopularFilmsState {
  PopularFilmsState({required this.popularFilmsModel, required this.isloading});

  final PopularFilmModel popularFilmsModel;
  final bool isloading;
  

  PopularFilmsState copyWith({
    PopularFilmModel? popularFilmsModel,
    bool? isloading,
  }) {
    return PopularFilmsState(
      popularFilmsModel: popularFilmsModel ?? this.popularFilmsModel,
      isloading: isloading ?? this.isloading,
    );
  }
}
