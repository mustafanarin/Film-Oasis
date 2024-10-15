import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/project_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(AppProviderItems.nowShowingProvider.notifier).getNowShowing();
      ref.read(AppProviderItems.popularFilmsProvider.notifier).getPopularFilms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final nowShowing = ref.watch(AppProviderItems.nowShowingProvider);
    final popularFilms = ref.watch(AppProviderItems.popularFilmsProvider);
    final genres = ref.watch(AppProviderItems.genreProvider);

    return Scaffold(
      appBar: const _AppbarHomePage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllLow2,
          child: Column(
            children: [
              _RowTitleAndButton(title: ProjectStrings.showingTitle, onPressed: () {}),
              _ListViewNowShowing(nowShowing: nowShowing),
              _RowTitleAndButton(title: ProjectStrings.popularTitle, onPressed: () {}),
              genres.when(
                data: (genreModel) {
                  return _ListViewPopularFilms(
                    popularFilms: popularFilms,
                    genreModel: genreModel,
                  );
                },
                loading: CircularProgressIndicator.adaptive,
                error: (error, stack) => const Text(ProjectStrings.errorGenres),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppbarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(ProjectStrings.projectName),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ListViewNowShowing extends StatelessWidget {
  const _ListViewNowShowing({
    required this.nowShowing,
  });

  final NowShowingState nowShowing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.4),
      child: nowShowing.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : OverflowBox(
              maxWidth: context.dynamicWidth(1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                padding: context.paddingAllLow2,
                itemBuilder: (context, index) {
                  final film = nowShowing.nowShowingModel.results?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ImageNetworkWithContainer(film: film?.posterPath, height: context.dynamicHeight(0.25)),
                      _TextFilmTitle(film: film),
                      _TextNowShowingIMBd(film: film),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

class _TextFilmTitle extends StatelessWidget {
  const _TextFilmTitle({
    required this.film,
  });

  final Results? film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.375),
      child: Padding(
        padding: context.paddingVerticalLow1,
        child: Text(
          film?.title ?? '',
          style: context.textTheme().bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _TextNowShowingIMBd extends StatelessWidget {
  const _TextNowShowingIMBd({
    required this.film,
  });

  final Results? film;

  @override
  Widget build(BuildContext context) {
    return Text(
      "⭐️ ${film?.voteAverage?.toStringAsFixed(1) ?? ""}${ProjectStrings.imbdText}",
      style: context.textTheme().bodySmall,
    );
  }
}

class _ListViewPopularFilms extends StatelessWidget {
  const _ListViewPopularFilms({
    required this.popularFilms,
    required this.genreModel,
  });

  final PopularFilmsState popularFilms;
  final GenreModel genreModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final popularFilm = popularFilms.popularFilmsModel.results?[index];
        return Padding(
          padding: context.paddingVerticalLow1,
          child: Row(
            children: [
              _ImageNetworkWithContainer(
                film: popularFilm?.posterPath,
                height: context.dynamicHeight(0.19),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: context.lowValue2, bottom: context.lowValue1),
                  child: SizedBox(
                    height: context.dynamicHeight(0.19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _TextFilmName(popularFilm: popularFilm),
                        _TextIMBd(popularFilm: popularFilm),
                        _ContainerGenreOfFilm(
                          popularFilm: popularFilm,
                          genreModel: genreModel,
                        ),
                        _TextFilmRelaseDate(popularFilm: popularFilm),
                        const SizedBox(height: 1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TextFilmName extends StatelessWidget {
  const _TextFilmName({
    required this.popularFilm,
  });

  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Text(
      popularFilm?.title ?? '',
      style: context.textTheme().bodyMedium,
    );
  }
}

class _TextIMBd extends StatelessWidget {
  const _TextIMBd({
    required this.popularFilm,
  });

  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Text(
      "⭐️ ${popularFilm?.voteAverage?.toStringAsFixed(1) ?? ''}${ProjectStrings.imbdText}",
      style: context.textTheme().bodySmall?.copyWith(
            color: ProjectColors.grey600,
          ),
    );
  }
}

class _ContainerGenreOfFilm extends StatelessWidget {
  const _ContainerGenreOfFilm({
    required this.popularFilm,
    required this.genreModel,
  });

  final GenreModel genreModel;
  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: popularFilm?.genreIds?.map((genreId) {
            final genre = genreModel.genres?.firstWhere(
              (g) => g.id == genreId,
              orElse: () => Genre(id: -1, name: ''),
            );
            return ClipRRect(
              borderRadius: BorderRadius.circular(ProjectRadius.normal.value),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.lowValue2,
                  vertical: context.dynamicHeight(0.006),
                ),
                color: ProjectColors.lavender,
                child: Text(genre?.name?.toUpperCase() ?? '', style: context.textTheme().labelSmall),
              ),
            );
          }).toList() ??
          [],
    );
  }
}

class _TextFilmRelaseDate extends StatelessWidget {
  const _TextFilmRelaseDate({
    required this.popularFilm,
  });

  final MovieResult? popularFilm;

  @override
  Widget build(BuildContext context) {
    return Text(
      popularFilm?.releaseDate ?? '',
      style: context.textTheme().bodySmall,
    );
  }
}

class _ImageNetworkWithContainer extends StatelessWidget {
  const _ImageNetworkWithContainer({
    required this.film,
    required this.height,
  });

  final String? film;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: film != null
            ? Image.network(
                height: height,
                width: height * 2 / 3,
                '${ProjectStrings.filmImagePath}$film',
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                fit: BoxFit.cover,
              )
            : SizedBox(
                height: height,
                width: height * 2 / 3,
                child: const Placeholder(
                  color: ProjectColors.grey,
                ),
              ),
      ),
    );
  }
}

class _RowTitleAndButton extends StatelessWidget {
  const _RowTitleAndButton({
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme().bodyLarge,
        ),
        SeeMoreButton(onPressed: onPressed),
      ],
    );
  }
}
