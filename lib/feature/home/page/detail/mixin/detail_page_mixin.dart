import 'package:film_oasis/feature/favorite/provider/favorite_provider.dart';
import 'package:film_oasis/feature/home/model/film_detail_model.dart';
import 'package:film_oasis/feature/home/page/detail/detail_page.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

mixin DetailPageMixin on ConsumerState<DetailPage> {
  static const _errorMessageDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(AppProviderItems.filmDetailProvider.notifier).getFilmDetail(
            widget.filmId,
          );
    });
  }

  Future<void> launchFilmUrl(Uri url, BuildContext context) async {
    try {
      await _launchUrl(url);
    } catch (e) {
      if (context.mounted) _errorScafoldMesenger(context);
    }
  }

  Future<void> _launchUrl(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void _errorScafoldMesenger(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          ProjectStrings.snackBarLinkError,
        ),
        duration: _errorMessageDuration,
        action: SnackBarAction(
          label: ProjectStrings.snacbarActionText,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void toggleFavorite(FilmDetailModel film) {
    ref.read(favoriteProvider.notifier).toggleFavorite(film);
  }

  bool checkIsFavorite(FilmDetailModel film) {
    return ref.watch(favoriteProvider).model?.any(
              (f) => f.id == film.id,
            ) ??
        false;
  }

  BoxDecoration topRadiusDecoration() {
    return BoxDecoration(
      color: ProjectColors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(ProjectRadius.small.value),
      ),
    );
  }
}