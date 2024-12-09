import 'package:film_oasis/feature/home/model/genre_model.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class GenreChips extends StatelessWidget {
  const GenreChips({
    required this.genres,
    super.key,
    this.genreIds,
    this.genreModel,
  });

  const GenreChips.fromIds({
    required this.genreIds,
    required this.genreModel,
    super.key,
  }) : genres = null;

  final List<Genre>? genres; // For Detail Page
  final List<int>? genreIds; // For Home Page
  final GenreModel? genreModel; // For Home Page

  @override
  Widget build(BuildContext context) {
    final displayGenres = genres ??
        genreIds?.map((genreId) {
          return genreModel?.genres?.firstWhere(
                (g) => g.id == genreId,
                orElse: () => Genre(id: -1, name: ''),
              ) ??
              Genre(id: -1, name: '');
        }).toList() ??
        [];

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: displayGenres.map((genre) {
        return ClipRRect(
          borderRadius: AppRadius.smallCircular(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.lowValue2,
              vertical: context.dynamicHeight(0.006),
            ),
            color: ProjectColors.lavender,
            child: Text(
              genre.name?.toUpperCase() ?? '',
              style: context.textTheme().labelSmall,
            ),
          ),
        );
      }).toList(),
    );
  }
}
