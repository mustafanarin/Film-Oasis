import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/widgets/cached_network_image.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SeeMorePage extends StatefulWidget {
  const SeeMorePage({required this.movieList, super.key});
  final List<dynamic> movieList;
  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  late final List<dynamic> films;
  List<Results>? nowShowing = [];
  List<MovieResult>? popular = [];
  bool isNowShowing = false;

  @override
  void initState() {
    super.initState();
    if (widget.movieList.isNotEmpty) {
      films = widget.movieList;
      if (films.first is Results) {
        isNowShowing = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isNowShowing ? ProjectStrings.showingTitle : ProjectStrings.popularTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.lowValue2, vertical: context.lowValue1),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3.7,
            crossAxisSpacing: 15,
          ),
          itemCount: films.length,
          itemBuilder: (context, index) {
            if (isNowShowing) {
              nowShowing = List.from(films);
              final filmNow = nowShowing![index];
              return _ColumnFilmItem(
                title: filmNow.title,
                imagePath: filmNow.posterPath,
                imbd: filmNow.voteAverage,
                filmId: filmNow.id,
              );
            } else {
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

class _ColumnFilmItem extends StatelessWidget {
  const _ColumnFilmItem({
    super.key,
    this.title,
    this.imagePath,
    this.imbd,
    this.filmId,
  });
  final String? title;
  final String? imagePath;
  final double? imbd;
  final int? filmId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(DetailRoute(filmId: filmId ?? 0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageFilm(imagePath: imagePath),
          SizedBox(height: context.lowValue1),
          _TextFilmTitle(title: title),
          SizedBox(height: context.dynamicHeight(0.005)),
          TextFilmIMBd(imbd: imbd),
        ],
      ),
    );
  }
}

class _ImageFilm extends StatelessWidget {
  const _ImageFilm({
    required this.imagePath,
    super.key,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ProjectCachedImage(
      imageUrl: imagePath,
      height: context.dynamicHeight(0.3125),
      width: double.infinity,
    );
  }
}

class _TextFilmTitle extends StatelessWidget {
  const _TextFilmTitle({
    required this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: context.textTheme().bodyMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
