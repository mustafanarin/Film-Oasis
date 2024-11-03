import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart' as film_genre;
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/core/format_number.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/cached_network_image.dart';
import 'package:film_oasis/product/widgets/genre_chips.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DetailPage extends ConsumerStatefulWidget {
  const DetailPage(this.filmId, {super.key});
  final int filmId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(AppProviderItems.filmDetailProvider.notifier).getFilmDetail(widget.filmId);
    });
  }

  Future<void> _launchUrl(Uri url, BuildContext context) async {
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              ProjectStrings.snackBarLinkError,
            ),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: ProjectStrings.snacbarActionText,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(AppProviderItems.filmDetailProvider);
    final film = detail.filmDetailModel;
    final filmUrl = Uri.parse(film.homepage ?? '');

    return Scaffold(
      body: detail.isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Stack(
              children: [
                _BackdropImage(
                  film: film,
                  onLinkPressed: () => _launchUrl(filmUrl, context),
                ),
                SizedBox(height: context.dynamicHeight(0.3)),
                Column(
                  children: [
                    SizedBox(height: context.dynamicHeight(0.3)),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: _topRadiusDecoration(),
                            child: Padding(
                              padding: context.paddingAllLow2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _TextFilmTitle(film: film),
                                          _TextTagline(tagline: film.tagline),
                                          _TextIMDbAndPopularity(film: film),
                                          _GenreChipsFilm(film: film),
                                          _RowFilmInfos(film: film),
                                          const _TextDescriptonTitle(),
                                          _TextDescription(film: film),
                                        ],
                                      ),
                                    ),
                                  ),
                                  _CompaniesTitleAndCompaniesRow(film: film),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: context.lowValue1,
                            top: context.lowValue1,
                            child: Padding(
                              padding: context.paddingAllLow2,
                              child: const Icon(
                                Icons.bookmark_outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  BoxDecoration _topRadiusDecoration() {
    return BoxDecoration(
      color: ProjectColors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(ProjectRadius.small.value),
      ),
    );
  }
}

class _TextTagline extends StatelessWidget {
  const _TextTagline({
    required this.tagline,
  });

  final String? tagline;

  @override
  Widget build(BuildContext context) {
    if (tagline == null || tagline!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue1),
      child: Text(
        '"$tagline"',
        style: context.textTheme().bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: ProjectColors.grey,
            ),
      ),
    );
  }
}

class _BackdropImage extends StatelessWidget {
  const _BackdropImage({
    required this.film,
    required this.onLinkPressed,
  });

  final FilmDetailModel film;
  final VoidCallback onLinkPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProjectCachedImage(
          imageUrl: film.backdropPath,
          height: context.dynamicHeight(0.32),
          width: context.dynamicWidth(1),
          withShadow: false,
          isBackdrop: true,
        ),
        Positioned(
          top: context.dynamicHeight(0.13),
          left: context.dynamicWidth(0.45),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: ProjectRadius.medium.value,
            child: IconButton(
              onPressed: onLinkPressed,
              icon: const Icon(
                Icons.link_outlined,
                color: ProjectColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RowFilmInfos extends StatelessWidget {
  const _RowFilmInfos({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TextCountryColumn(film: film),
        const Spacer(),
        _TextLanguageColumn(film: film),
        const Spacer(),
        _TextBudgetColumn(film: film),
        const Spacer(),
      ],
    );
  }
}

class _TextFilmTitle extends StatelessWidget {
  const _TextFilmTitle({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      child: Text(
        film.title ?? '',
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TextIMDbAndPopularity extends StatelessWidget {
  const _TextIMDbAndPopularity({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.lowValue1,
      ),
      child: Row(
        children: [
          TextFilmIMBd(
            imbd: film.voteAverage,
          ),
          const Spacer(),
          if (film.popularity != null) ...[
            Icon(Icons.trending_up, size: context.lowValue2),
            SizedBox(width: context.lowValue1),
            Text(
              film.popularity!.toStringAsFixed(1),
              style: context.textTheme().bodySmall,
            ),
          ],
          const Spacer(),
          ReleaseDateText(releaseDate: film.releaseDate),
          const Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}

class _TextCountryColumn extends StatelessWidget {
  const _TextCountryColumn({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ProjectStrings.country,
          style: context.textTheme().bodySmall,
        ),
        Text(
          film.originCountry?[0] ?? '-',
          style: context.textTheme().labelMedium,
        ),
      ],
    );
  }
}

class _TextLanguageColumn extends StatelessWidget {
  const _TextLanguageColumn({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ProjectStrings.language,
          style: context.textTheme().bodySmall,
        ),
        Text(
          film.spokenLanguages?[0].englishName ?? '-',
          style: context.textTheme().labelMedium,
        ),
      ],
    );
  }
}

class _TextBudgetColumn extends StatelessWidget {
  const _TextBudgetColumn({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ProjectStrings.budget,
          style: context.textTheme().bodySmall,
        ),
        Text(
          '${FormatNumber.formatBudgetWithDots(
            film.budget,
          )} \$',
          style: context.textTheme().labelMedium,
        ),
      ],
    );
  }
}

class _TextDescriptonTitle extends StatelessWidget {
  const _TextDescriptonTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.lowValue2,
      ),
      child: Text(
        ProjectStrings.description,
        style: context.textTheme().bodyLarge,
      ),
    );
  }
}

class _TextDescription extends StatelessWidget {
  const _TextDescription({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Text(
      film.overview ?? '-',
      style: context.textTheme().bodySmall,
    );
  }
}

class _CompaniesTitleAndCompaniesRow extends StatelessWidget {
  const _CompaniesTitleAndCompaniesRow({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.mediumValue,
          ),
          child: Text(
            ProjectStrings.companies,
            style: context.textTheme().bodyLarge,
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              (film.productionCompanies?.length ?? 0) >= 4 ? 4 : (film.productionCompanies?.length ?? 0),
              (index) {
                final company = film.productionCompanies?[index];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Column(
                      children: [
                        _ImageCompanies(company: company),
                        SizedBox(
                          height: context.lowValue1,
                        ),
                        _TextCompaniesName(company: company),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageCompanies extends StatelessWidget {
  const _ImageCompanies({
    required this.company,
  });

  final ProductionCompany? company;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ProjectCachedImage(
        imageUrl: company?.logoPath,
        fit: BoxFit.contain,
        withShadow: false,
      ),
    );
  }
}

class _TextCompaniesName extends StatelessWidget {
  const _TextCompaniesName({
    required this.company,
  });

  final ProductionCompany? company;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.highValue,
      alignment: Alignment.center,
      child: Text(
        company?.name ?? '',
        style: context.textTheme().labelMedium,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}

class _GenreChipsFilm extends StatelessWidget {
  const _GenreChipsFilm({
    required this.film,
  });

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow2,
      child: GenreChips(
        genres: film.genres
            ?.map(
              (g) => film_genre.Genre(
                id: g.id,
                name: g.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
