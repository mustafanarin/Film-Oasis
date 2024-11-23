part of '../see_more_page.dart';
class _ColumnFilmItem extends StatelessWidget {
  const _ColumnFilmItem({
    super.key,
    this.title,
    this.imagePath,
    this.imbd,
    this.filmId,
  });
  final String? title;
  final String? imagePath;
  final double? imbd;
  final int? filmId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(DetailRoute(filmId: filmId ?? 0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageFilm(imagePath: imagePath),
          SizedBox(height: context.lowValue1),
          _TextFilmTitle(title: title),
          SizedBox(height: context.dynamicHeight(0.005)),
          TextFilmIMBd(imbd: imbd),
        ],
      ),
    );
  }
}

class _ImageFilm extends StatelessWidget {
  const _ImageFilm({
    required this.imagePath,
    super.key,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ProjectCachedImage(
      imageUrl: imagePath,
      height: context.dynamicHeight(0.3125),
      width: double.infinity,
    );
  }
}

class _TextFilmTitle extends StatelessWidget {
  const _TextFilmTitle({
    required this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: context.textTheme().bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
