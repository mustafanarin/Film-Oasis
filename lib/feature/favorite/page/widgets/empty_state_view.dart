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
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            searchQuery.isNotEmpty ? Icons.search_off : Icons.favorite_outline,
            size: context.dynamicHeight(0.12),
            color: ProjectColors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            searchQuery.isNotEmpty ? 'Aradığınız kriterlere uygun film bulunamadı' : 'Henüz favori film eklemediniz',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (searchQuery.isNotEmpty) ...[
            SizedBox(height: context.lowValue2),
            ElevatedButton(
              onPressed: onClearSearch,
              child: Text(
                'Aramayı Temizle',
                style: textTheme.labelMedium,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

