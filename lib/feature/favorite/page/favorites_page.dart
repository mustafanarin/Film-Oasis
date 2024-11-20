import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/page/mixin/favorite_page_mixin.dart';
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

// TODO film image cacheden kullan

part './widgets/animation_appbar.dart';
part './widgets/empty_state_view.dart';
part './widgets/favorites_films.dart';
part './widgets/film_card.dart';

@RoutePage()
final class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> with SingleTickerProviderStateMixin, FavoritePageMixin {
  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoriteProvider);
    final favorites = favoriteState.model ?? [];
    final filteredFavorites = filterFavorites(favorites);

    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: _FavoritesAppBar(
        isSearching: isSearching,
        onSearchToggle: toggleSearch,
        searchController: searchController,
        searchFocusNode: searchFocusNode,
        animationController: animationController,
        onSearchChanged: updateSearchQuery,
      ),
      body: favoriteState.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : filteredFavorites.isEmpty
              ? _EmptyStateView(
                  searchQuery: searchQuery,
                  onClearSearch: clearSearch,
                )
              : _FavoritesFilms(
                  searchQuery: searchQuery,
                  filteredFavorites: filteredFavorites,
                ),
    );
  }
}
