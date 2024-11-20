part of '../detail_page.dart';

class _TextFilmTitle extends StatelessWidget {  
  const _TextFilmTitle({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      child: Text(
        film.title ?? '',
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TextDescriptonTitle extends StatelessWidget {
  const _TextDescriptonTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.lowValue2,
      ),
      child: Text(
        ProjectStrings.description,
        style: context.textTheme().bodyLarge,
      ),
    );
  }
}

class _TextDescription extends StatelessWidget {
  const _TextDescription({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Text(
      film.overview ?? '-',
      style: context.textTheme().bodySmall,
    );
  }
}