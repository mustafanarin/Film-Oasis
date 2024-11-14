import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  String _searchQuery = '';
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    Future.microtask(() {
      ref.read(favoriteProvider.notifier).getFavorite();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _animationController.forward();
        _searchFocusNode.requestFocus();
      } else {
        _animationController.reverse();
        _searchQuery = '';
        _searchController.clear();
        _searchFocusNode.unfocus();
      }
    });
  }

  List<FilmDetailModel> _filterFavorites(List<FilmDetailModel> favorites) {
    if (_searchQuery.isEmpty) return favorites;

    return favorites.where((film) {
      final title = film.title?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase();

      return title.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteProvider);
    final favorites = favoriteState.model ?? [];
    final filteredFavorites = _filterFavorites(favorites);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: AppBar(
        title: _isSearching
            ? SizeTransition(
                sizeFactor: _animationController,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  style: textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Film ara...',
                    hintStyle: textTheme.bodySmall,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.lowValue2,
                      vertical: context.lowValue1,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              )
            : const Text(
                'Favorites',
              ),
        centerTitle: !_isSearching,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          if (_isSearching) SizedBox(width: context.lowValue1),
        ],
      ),
      body: favoriteState.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : filteredFavorites.isEmpty
              ? _buildEmptyState(textTheme)
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    if (_searchQuery.isNotEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(context.lowValue2),
                          child: Row(
                            children: [
                              Text(
                                '"$_searchQuery" için sonuçlar',
                                style: textTheme.bodySmall,
                              ),
                              SizedBox(width: context.lowValue1),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.lowValue1,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ProjectColors.cobaltBlue,
                                  borderRadius: BorderRadius.circular(
                                    ProjectRadius.small.value,
                                  ),
                                ),
                                child: Text(
                                  filteredFavorites.length.toString(),
                                  style: textTheme.labelSmall?.copyWith(
                                    color: ProjectColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SliverPadding(
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
                            final film = filteredFavorites[index];
                            return _FilmCard(film: film);
                          },
                          childCount: filteredFavorites.length,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _searchQuery.isNotEmpty ? Icons.search_off : Icons.favorite_outline,
            size: context.dynamicHeight(0.12),
            color: ProjectColors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            _searchQuery.isNotEmpty ? 'Aradığınız kriterlere uygun film bulunamadı' : 'Henüz favori film eklemediniz',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (_searchQuery.isNotEmpty) ...[
            SizedBox(height: context.lowValue2),
            ElevatedButton(
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchQuery = '';
                });
              },
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
