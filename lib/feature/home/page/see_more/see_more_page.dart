import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/page/see_more/mixin/see_more_page_mixin.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/widgets/image/cached_network_image.dart';
import 'package:film_oasis/product/widgets/text/text_film_imbd.dart';
import 'package:flutter/material.dart';

part './widgets/column_film_items.dart';

@RoutePage()
final class SeeMorePage extends StatefulWidget {
  const SeeMorePage({required this.movieList, super.key});
  final List<dynamic> movieList;
  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> with SeeMorePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getPageTitle()),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.lowValue2, vertical: context.lowValue1),
        child: GridView.builder(
          gridDelegate: sliverGridDelegateWithFixedCrossAxisCount(),
          itemCount: films.length,
          itemBuilder: (context, index) {

            // list NowShowingFilms? if not PopularFilms
            if (isNowShowing) {
              nowShowing = List.from(films);
              final filmNow = nowShowing![index];
              return _ColumnFilmItem(
                title: filmNow.title,
                imagePath: filmNow.posterPath,
                imbd: filmNow.voteAverage,
                filmId: filmNow.id,
              );
            } 
            else {
              popular = List.from(films);
              final filmPop = popular![index];
              return _ColumnFilmItem(
                title: filmPop.title,
                imagePath: filmPop.posterPath,
                imbd: filmPop.voteAverage,
                filmId: filmPop.id,
              );
            }
          },
        ),
      ),
    );
  }
}
