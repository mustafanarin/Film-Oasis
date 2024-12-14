import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/model/genre_model.dart' as film_genre;
import 'package:film_oasis/feature/home/page/detail/mixin/detail_page_mixin.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/core/budget_formatter.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/image/cached_network_image.dart';
import 'package:film_oasis/product/widgets/general/error_view.dart';
import 'package:film_oasis/product/widgets/general/genre_chips.dart';
import 'package:film_oasis/product/widgets/text/release_date_text.dart';
import 'package:film_oasis/product/widgets/text/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './widgets/back_drop_image.dart';
part './widgets/companies_info_row.dart';
part './widgets/description_and_title.dart';
part './widgets/detail_error_view.dart';
part './widgets/favorite_icon.dart';
part './widgets/film_genre_chips.dart';
part './widgets/imbd_and_popularity.dart';
part './widgets/row_film_infos.dart';
part './widgets/text_tag_line.dart';

@RoutePage()
final class DetailPage extends ConsumerStatefulWidget {
  const DetailPage(this.filmId, {super.key});
  final int filmId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> with DetailPageMixin {
  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(AppProviderItems.filmDetailProvider);

    return Scaffold(
      body: detailAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stack) => const _DetailErrorView(),
        data: (film) {
          final filmUrl = Uri.parse(film.homepage ?? '');
          return Stack(
            children: [
              _BackdropImage(
                film: film,
                onLinkPressed: () => launchFilmUrl(filmUrl, context),
              ),
              SizedBox(height: context.dynamicHeight(0.3)),
              Column(
                children: [
                  SizedBox(height: context.dynamicHeight(0.3)),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: topRadiusDecoration(),
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
                          child: _FavoriteIcon(
                            film: film,
                            checkIsFavorite: checkIsFavorite,
                            toggleFavorite: toggleFavorite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
