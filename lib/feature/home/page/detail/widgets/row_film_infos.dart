part of '../detail_page.dart';

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
          '${BudgetFormatter.formatBudgetWithDots(
            film.budget,
          )} \$',
          style: context.textTheme().labelMedium,
        ),
      ],
    );
  }
}
