// Enhanced ListView Now Showing
part of '../home_page.dart';

class _ListViewNowShowing extends ConsumerWidget {
  const _ListViewNowShowing();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowShowingAsync = ref.watch(AppProviderItems.nowShowingProvider);

    return nowShowingAsync.when(
      loading: () => SizedBox(
        height: context.dynamicHeight(0.4),
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      error: (error, stackTrace) => SizedBox(
        height: context.dynamicHeight(0.4),
        child: Center(child: ErrorView()),
      ),
      data: (model) => SizedBox(
        height: context.dynamicHeight(0.4),
        child: OverflowBox(
          maxWidth: context.dynamicWidth(1),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            padding: context.paddingAllLow2,
            itemBuilder: (context, index) {
              final film = model.results?[index];
              return GestureDetector(
                onTap: () => context.pushRoute(DetailRoute(filmId: film?.id ?? 1)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectCachedImage(
                      imageUrl: film?.posterPath,
                      height: context.dynamicHeight(0.25),
                      width: context.dynamicHeight(0.25) * 2 / 3,
                    ),
                    _TextFilmTitle(film: film),
                    TextFilmIMBd(imbd: film?.voteAverage),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TextFilmTitle extends StatelessWidget {
  const _TextFilmTitle({
    required this.film,
  });

  final Results? film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.375),
      child: Padding(
        padding: context.paddingVerticalLow1,
        child: Text(
          film?.title ?? '',
          style: context.textTheme().bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
