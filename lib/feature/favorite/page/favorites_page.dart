import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(favoriteProvider.notifier).getFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteProvider);
    final favorites = favoriteState.model ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoriteState.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : favorites.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: context.paddingAllLow2,
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
                            return _FilmCard(
                              film: film,
                            );
                          },
                          childCount: favorites.length,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

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
            onTap: () {},
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
                    top: 8,
                    right: 8,
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
                  bottom: 8,
                  right: 8,
                  child: Consumer(
                    builder: (context, ref, child) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          ref.read(favoriteProvider.notifier).toggleFavorite(film);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
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
