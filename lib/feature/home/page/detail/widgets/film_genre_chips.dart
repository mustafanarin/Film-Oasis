part of '../detail_page.dart';
class _GenreChipsFilm extends StatelessWidget {
  const _GenreChipsFilm({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow2,
      child: GenreChips(
        genres: film.genres
            ?.map(
              (g) => film_genre.Genre(
                id: g.id,
                name: g.name,
              ),
            )
            .toList(),
      ),
    );
  }
}