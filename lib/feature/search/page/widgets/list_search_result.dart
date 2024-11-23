part of '../search_page.dart';

final class _ListViewSearchResult extends StatelessWidget {
  const _ListViewSearchResult({
    required this.state, required this.searchQuery,
  });

  final SearchState state;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.lowValue2),
            child: Row(
              children: [
                Text(
                  '"$searchQuery" ${ProjectStrings.forResults}',
                  style: context.textTheme().bodySmall,
                ),
                SizedBox(width: context.lowValue1),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.lowValue1,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ProjectColors.cobaltBlue,
                    borderRadius: BorderRadius.circular(ProjectRadius.small.value),
                  ),
                  child: Text(
                    "${state.searchModel.results?.length ?? 0}",
                    style: context.textTheme().labelSmall?.copyWith(
                          color: ProjectColors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.searchModel.results?.length ?? 0,
              itemBuilder: (context, index) {
                final movie = state.searchModel.results![index];
                return _CardFilmItem(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CardFilmItem extends StatelessWidget {
  const _CardFilmItem({
    required this.movie,
  });

  final SearchResult movie;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue1),
      child: Card(
        color: isDarkMode
            ? Color.lerp(ProjectColors.darkSurface, ProjectColors.cobaltBlue, 0.05)
            : Theme.of(context).scaffoldBackgroundColor,
        elevation: ProjectElevation.small.value,
        child: ListTile(
          contentPadding: context.paddingAllLow1,
          leading: movie.posterPath != null
              ? Image.network(
                  '${ProjectStrings.filmImagePath}${movie.posterPath}',
                  width: context.dynamicWidth(0.11),
                  height: context.dynamicHeight(0.1),
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  width: context.dynamicWidth(0.11),
                  height: context.dynamicHeight(0.1),
                  child: const Icon(Icons.movie_outlined),
                ),
          title: Text(
            movie.title ?? '-',
            style: context.textTheme().bodyMedium,
          ),
          subtitle: _FilmDateAndImbd(movie: movie),
          onTap: () {
            context.pushRoute(DetailRoute(filmId: movie.id ?? 0));
          },
        ),
      ),
    );
  }
}
