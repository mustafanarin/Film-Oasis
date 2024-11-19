part of '../search_page.dart';

final class _FilmDateAndImbd extends StatelessWidget {
  const _FilmDateAndImbd({
    required this.movie,
  });

  final SearchResult movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.lowValue1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReleaseDateText(releaseDate: movie.releaseDate),
          TextFilmIMBd(imbd: movie.voteAverage ?? 0),
        ],
      ),
    );
  }
}