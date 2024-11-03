import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/cached_network_image.dart';
import 'package:film_oasis/product/widgets/genre_chips.dart';
import 'package:film_oasis/product/widgets/project_button.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
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

    return Scaffold(
      appBar: const _AppbarHomePage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllLow2,
          child: Column(
            children: [
              _RowTitleAndButton(
                title: ProjectStrings.showingTitle,
                onPressed: () => context.pushRoute(SeeMoreRoute(movieList: nowShowing.nowShowingModel.results ?? [])),
              ),
              _ListViewNowShowing(nowShowing: nowShowing),
              _RowTitleAndButton(
                title: ProjectStrings.popularTitle,
                onPressed: () =>
                    context.pushRoute(SeeMoreRoute(movieList: popularFilms.popularFilmsModel.results ?? [])),
              ),
              _PopularFilmsSection(popularFilms: popularFilms),
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
                  return GestureDetector(
                    onTap: () => context.pushRoute(DetailRoute(filmId: film?.id ?? 1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectCachedImage(
                          imageUrl: film?.posterPath,
                          height: context.dynamicHeight(0.25),
                          width: context.dynamicHeight(0.25) * 2 / 3,
                        ),
                        _TextFilmTitle(film: film),
                        TextFilmIMBd(imbd: film?.voteAverage),
                      ],
                    ),
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

class _PopularFilmsSection extends ConsumerWidget {
  const _PopularFilmsSection({
    required this.popularFilms,
  });

  final PopularFilmsState popularFilms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreAsync = ref.watch(AppProviderItems.genreProvider);

    return genreAsync.when(
      error: (error, stack) => const Text(ProjectStrings.errorGenres),
      loading: () => const CircularProgressIndicator.adaptive(),
      data: (genreModel) {
        return ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final popularFilm = popularFilms.popularFilmsModel.results?[index];
            return Padding(
              padding: context.paddingVerticalLow1,
              child: GestureDetector(
                onTap: () => context.pushRoute(DetailRoute(filmId: popularFilm?.id ?? 0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProjectCachedImage(
                      imageUrl: popularFilm?.posterPath,
                      height: context.dynamicHeight(0.19),
                      width: context.dynamicHeight(0.19) * 2 / 3,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.lowValue2,
                          bottom: context.lowValue1,
                        ),
                        child: SizedBox(
                          height: context.dynamicHeight(0.19),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _TextFilmName(popularFilm: popularFilm),
                              _TextIMBd(popularFilm: popularFilm),
                              GenreChips.fromIds(
                                genreIds: popularFilm?.genreIds,
                                genreModel: genreModel,
                              ),
                              ReleaseDateText(releaseDate: popularFilm?.releaseDate),
                              SizedBox(height: 1,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
