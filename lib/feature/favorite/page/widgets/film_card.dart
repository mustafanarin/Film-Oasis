part of '../favorites_page.dart';

class _FilmCard extends StatelessWidget {
  const _FilmCard({
    required this.film,
    super.key,
  });
  final FilmDetailModel film;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ProjectRadius.medium.value),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ProjectRadius.medium.value),
        child: Material(
          color: ProjectColors.white,
          child: InkWell(
            onTap: () {
              context.pushRoute(DetailRoute(filmId: film.id ?? 0));
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Hero(
                        tag: 'movie_${film.id}',
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${film.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
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
                            ),
                            SizedBox(height: context.lowValue1 / 2),
                            ReleaseDateText(releaseDate: film.releaseDate),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (film.voteAverage != null)
                  Positioned(
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
                            ProjectColors.black.withOpacity(0.8),
                            ProjectColors.black.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(ProjectRadius.small.value),
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
                            style: context.textTheme().labelMedium?.copyWith(
                                  color: ProjectColors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Positioned(
                  bottom: context.lowValue1,
                  right: context.lowValue1,
                  child: Consumer(
                    builder: (context, ref, child) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(ProjectRadius.small.value),
                        onTap: () {
                          ref.read(favoriteProvider.notifier).toggleFavorite(film);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
