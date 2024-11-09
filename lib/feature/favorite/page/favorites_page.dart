import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
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
    // TODO: implement initState
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
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final film = favorites[index];
                    return ListTile(
                      title: Text(film.title ?? ''),
                      subtitle: Text(film.overview ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            ref.read(favoriteProvider.notifier).toggleFavorite(film);
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            color: Colors.red,
                          )),
                    );
                  },
                ),
    );
  }
}
