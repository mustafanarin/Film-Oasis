import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/search/model/search_model.dart';
import 'package:film_oasis/feature/search/state/search_state.dart';
import 'package:film_oasis/product/constants/enum/project_elevation.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/project_textfield.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchController;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        ref.watch(AppProviderItems.searchProvider.notifier).searchMovies(query);
      } else {
        ref.watch(AppProviderItems.searchProvider.notifier).clearSearch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(AppProviderItems.searchProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ProjectStrings.appbarSearch),
        ),
        body: Padding(
          padding: context.paddingHorizantalLow2,
          child: Column(
            children: [
              ProjectSearchTextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onClearPressed: () {
                  _searchController.clear();
                  ref.read(AppProviderItems.searchProvider.notifier).clearSearch();
                },
              ),
              if (state.isLoading)
                const _CircularProgessIndicator()
              else if (state.searchModel.results?.isNotEmpty ?? false)
                _ListViewSearchResult(state: state)
              else
                const _TextNoSearch(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularProgessIndicator extends StatelessWidget {
  const _CircularProgessIndicator();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

class _ListViewSearchResult extends StatelessWidget {
  const _ListViewSearchResult({
    required this.state,
  });

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.searchModel.results?.length ?? 0,
        itemBuilder: (context, index) {
          final movie = state.searchModel.results![index];
          return _CardFilmItem(movie: movie);
        },
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
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue1),
      child: Card(
        color: ProjectColors.white,
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

class _FilmDateAndImbd extends StatelessWidget {
  const _FilmDateAndImbd({
    required this.movie,
  });

  final SearchResult movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.lowValue1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            movie.releaseDate ?? '-',
            style: context.textTheme().bodySmall,
          ),
          TextFilmIMBd(imbd: movie.voteAverage ?? 0),
        ],
      ),
    );
  }
}

class _TextNoSearch extends StatelessWidget {
  const _TextNoSearch();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(ProjectStrings.noSearchText),
      ),
    );
  }
}
