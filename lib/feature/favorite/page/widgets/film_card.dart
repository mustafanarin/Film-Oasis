part of '../favorites_page.dart';

class _FilmCard extends StatelessWidget {
  const _FilmCard({
    required this.film,
    super.key,
  });
  final FilmDetailModel film;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.mediumCircular(),
        boxShadow: [
          _BoxShadowSettings(isDarkMode),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.mediumCircular(),
        child: Material(
          color: isDarkMode ? Theme.of(context).colorScheme.surface.withOpacity(0.8) : Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {
              context.pushRoute(DetailRoute(filmId: film.id ?? 0));
            },
            child: Container(
              decoration: BoxDecoration(
                border: isDarkMode
                    ? Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.1),
                        width: 0.5,
                      )
                    : null,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _FilmImage(film: film),
                      _FilmTitleAndDate(film: film),
                    ],
                  ),
                  if (film.voteAverage != null) _FilmImdb(film: film),
                  _FavoriteIconButton(film: film),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxShadow _BoxShadowSettings(bool isDarkMode) {
    return BoxShadow(
      color: isDarkMode ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
      blurRadius: isDarkMode ? 12 : 8,
      spreadRadius: isDarkMode ? 10 : 0,
      offset: const Offset(0, 4),
    );
  }
}

class _FilmImage extends StatelessWidget {
  const _FilmImage({
    required this.film,
    super.key,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Hero(
        tag: 'movie_${film.id}',
        child: ProjectCachedImage(
          imageUrl: film.posterPath,
          borderRadius: BorderRadius.circular(0),
          isFavoritePage: true,
        ),
      ),
    );
  }
}

class _FilmTitleAndDate extends StatelessWidget {
  const _FilmTitleAndDate({
    required this.film,
    super.key,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.paddingAllLow1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              film.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.lowValue1 / 2),
            ReleaseDateText(releaseDate: film.releaseDate),
          ],
        ),
      ),
    );
  }
}

class _FilmImdb extends StatelessWidget {
  const _FilmImdb({
    required this.film,
    super.key,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.lowValue1,
      right: context.lowValue1,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.lowValue1,
          vertical: context.lowValue1 / 2,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.5),
            ],
          ),
          borderRadius: AppRadius.smallCircular(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: ProjectColors.amber,
              size: IconSizes.small.value,
            ),
            SizedBox(
              width: context.lowValue1 / 2,
            ),
            Text(
              film.voteAverage!.toStringAsFixed(1),
              style: const TextStyle(
                color: ProjectColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteIconButton extends StatelessWidget {
  const _FavoriteIconButton({
    required this.film,
    super.key,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.lowValue1,
      right: context.lowValue1,
      child: Consumer(
        builder: (context, ref, child) => Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: AppRadius.smallCircular(),
            onTap: () {
              ref.read(AppProviderItems.favoriteProvider.notifier).toggleFavorite(film);
            },
            child: Container(
              padding: context.paddingAllLow1,
              child: Icon(
                Icons.favorite,
                color: ProjectColors.red,
                size: IconSizes.normal.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
