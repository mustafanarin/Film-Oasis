part of '../detail_page.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      flex: 2,
      child: ProjectCachedImage(
        imageUrl: company?.logoPath,
        fit: BoxFit.contain,
        withShadow: false,
        color: isDarkMode ? ProjectColors.white : null,
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