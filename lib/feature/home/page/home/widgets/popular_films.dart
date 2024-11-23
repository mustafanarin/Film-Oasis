part of '../home_page.dart';

class _PopularFilmsSection extends ConsumerWidget {
  const _PopularFilmsSection({
    required this.popularFilms,
  });

  final PopularFilmsState popularFilms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreAsync = ref.watch(AppProviderItems.genreProvider);

    return genreAsync.when(
      error: (error, stack) =>  Text(ProjectStrings.errorGenres),
      loading: () => const CircularProgressIndicator.adaptive(),
      data: (genreModel) {
        return ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final popularFilm = popularFilms.popularFilmsModel.results?[index];
            return Padding(
              padding: context.paddingVerticalLow1,
              child: GestureDetector(
                onTap: () => context.pushRoute(DetailRoute(filmId: popularFilm?.id ?? 0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProjectCachedImage(
                      imageUrl: popularFilm?.posterPath,
                      height: context.dynamicHeight(0.19),
                      width: context.dynamicHeight(0.19) * 2 / 3,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.lowValue2,
                          bottom: context.lowValue1,
                        ),
                        child: SizedBox(
                          height: context.dynamicHeight(0.19),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _TextFilmName(popularFilm: popularFilm),
                              _TextIMBd(popularFilm: popularFilm),
                              GenreChips.fromIds(
                                genreIds: popularFilm?.genreIds,
                                genreModel: genreModel,
                              ),
                              ReleaseDateText(releaseDate: popularFilm?.releaseDate),
                              const SizedBox(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TextFilmName extends StatelessWidget {
  const _TextFilmName({
    required this.popularFilm,
  });

  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Text(
      popularFilm?.title ?? '',
      style: context.textTheme().bodyMedium,
    );
  }
}

class _TextIMBd extends StatelessWidget {
  const _TextIMBd({
    required this.popularFilm,
  });

  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Text(
      "⭐️ ${popularFilm?.voteAverage?.toStringAsFixed(1) ?? ''}${ProjectStrings.imbdText}",
      style: context.textTheme().bodySmall?.copyWith(
            color: ProjectColors.grey600,
          ),
    );
  }
}
