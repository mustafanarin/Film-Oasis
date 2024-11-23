part of '../favorites_page.dart';

class _EmptyStateView extends StatelessWidget {
  const _EmptyStateView({
    required this.searchQuery,
    required this.onClearSearch,
  });
  final String searchQuery;
  final VoidCallback onClearSearch;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: context.paddingAllLow1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              searchQuery.isNotEmpty ? Icons.search_off : Icons.favorite_outline,
              size: context.dynamicHeight(0.12),
              color: ProjectColors.grey.withOpacity(0.5),
            ),
             SizedBox(height: context.mediumValue),
            Text(
              searchQuery.isNotEmpty ? ProjectStrings.noFoundFilm : ProjectStrings.noFavoriteFilm,
              style: context.textTheme().bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (searchQuery.isNotEmpty) ...[
              SizedBox(height: context.lowValue2),
              SearchClearButton(onClearSearch: onClearSearch),
            ],
          ],
        ),
      ),
    );
  }
}

