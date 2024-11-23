part of '../detail_page.dart';
class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon({
    required this.film,
    required this.checkIsFavorite,
    required this.toggleFavorite,
    super.key,
  });
  final FilmDetailModel film; 
  final bool Function(FilmDetailModel) checkIsFavorite;
  final void Function(FilmDetailModel) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    final isFavorite = checkIsFavorite(film);

    return Padding(
      padding: context.paddingAllLow2,
      child: IconButton(
        onPressed: () => toggleFavorite(film),
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: isFavorite ? ProjectColors.red : null,
        ),
      ),
    );
  }
}