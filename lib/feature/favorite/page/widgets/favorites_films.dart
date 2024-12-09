part of '../favorites_page.dart';

class _FavoritesFilms extends StatelessWidget {
  const _FavoritesFilms({
    required this.searchQuery,
    required this.filteredFavorites,
  });
  final String searchQuery;
  final List<FilmDetailModel> filteredFavorites;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        if (searchQuery.isNotEmpty)
          SearchResultsHeader(
            searchQuery: searchQuery,
            resultCount: filteredFavorites.length,
          ),
        _FavoritesGrid(favorites: filteredFavorites),
      ],
    );
  }
}

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({
    required this.searchQuery,
    required this.resultCount,
  });
  final String searchQuery;
  final int resultCount;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
                borderRadius: AppRadius.smallCircular(),
              ),
              child: Text(
                resultCount.toString(),
                style: context.textTheme().labelSmall?.copyWith(
                      color: ProjectColors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritesGrid extends StatelessWidget {
  const _FavoritesGrid({required this.favorites});
  final List<FilmDetailModel> favorites;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(context.lowValue2),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final film = favorites[index];
            return _FilmCard(film: film);
          },
          childCount: favorites.length,
        ),
      ),
    );
  }
}
