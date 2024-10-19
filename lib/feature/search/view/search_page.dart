import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/search/model/search_model.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:film_oasis/service/film_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO controller dispose
@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final FilmService _filmService = FilmService();
  final TextEditingController _searchController = TextEditingController();
  List<SearchResult> _searchResults = [];
  bool _isLoading = false;

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final searchModel = await _filmService.searchMovies(query);
      setState(() {
        _searchResults = searchModel.results ?? [];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred during the search: $e')),
      );
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Film Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _performSearch(_searchController.text),
                ),
              ),
              onSubmitted: _performSearch,
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = _searchResults[index];
                      return ListTile(
                        leading: movie.posterPath != null
                            ? Image.network(
                                '${ProjectStrings.filmImagePath}${movie.posterPath}',
                                width: 50,
                                height: 75,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox(width: 50, height: 75),
                        title: Text(movie.title ?? '-'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(movie.releaseDate ?? '-'),
                            TextFilmIMBd(imbd: movie.voteAverage ?? 0)
                          ],
                        ),
                        onTap: () {
                          context.pushRoute(DetailRoute(filmId: movie.id ?? 0));
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}