part of '../home_page.dart';

class _ListViewNowShowing extends StatelessWidget {
  const _ListViewNowShowing({
    required this.nowShowing,
  });

  final NowShowingState nowShowing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.4),
      child: nowShowing.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : OverflowBox(
              maxWidth: context.dynamicWidth(1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                padding: context.paddingAllLow2,
                itemBuilder: (context, index) {
                  final film = nowShowing.nowShowingModel.results?[index];
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
