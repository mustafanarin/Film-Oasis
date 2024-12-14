import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

final class TextFilmIMBd extends StatelessWidget {
  const TextFilmIMBd({
    required this.imbd,
    super.key,
  });

  final double? imbd;

  @override
  Widget build(BuildContext context) {
    return Text(
      "⭐️ ${imbd?.toStringAsFixed(1) ?? ""}${ProjectStrings.imbdText}",
      style: context.textTheme().bodySmall,
    );
  }
}
