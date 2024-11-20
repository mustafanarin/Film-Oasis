part of '../detail_page.dart';

class _TextIMDbAndPopularity extends StatelessWidget {
  const _TextIMDbAndPopularity({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.lowValue1,
      ),
      child: Row(
        children: [
          TextFilmIMBd(
            imbd: film.voteAverage,
          ),
          const Spacer(),
          if (film.popularity != null) ...[
            Icon(Icons.trending_up, size: context.lowValue2),
            SizedBox(width: context.lowValue1),
            Text(
              film.popularity!.toStringAsFixed(1),
              style: context.textTheme().bodySmall,
            ),
          ],
          const Spacer(),
          ReleaseDateText(releaseDate: film.releaseDate),
          const Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}

