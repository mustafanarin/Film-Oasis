import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/core/format_number.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(AppProviderItems.filmDetailProvider.notifier).getFilmDetail(726139);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(AppProviderItems.filmDetailProvider);
    final film = detail.filmDetailModel;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.dynamicHeight(0.35),
            color: Colors.amber,
          ),
          SizedBox(height: context.dynamicHeight(0.3)),
          Column(
            children: [
              SizedBox(height: context.dynamicHeight(0.3)),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: context.paddingAllLow2,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(film.title ?? '', style: context.textTheme().titleMedium),
                          TextFilmIMBd(imbd: film.voteAverage),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Budget',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    '${FormatNumber.formatBudgetWithDots(film.budget)} \$',
                                    style: context.textTheme().labelMedium,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Country',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    film.originCountry?[0] ?? '-',
                                    style: context.textTheme().labelMedium,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Language',
                                    style: context.textTheme().bodySmall,
                                  ),
                                  Text(
                                    film.spokenLanguages?[0].englishName ?? '-',
                                    style: context.textTheme().labelMedium,
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          Text(
                            'Description',
                            style: context.textTheme().bodyLarge,
                          ),
                          Text(
                            film.overview ?? "-",
                            style: context.textTheme().bodySmall,
                          ),
                          Text(
                            'Companies',
                            style: context.textTheme().bodyLarge,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                final company = film.productionCompanies?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        height: 75,
                                        width: 75,
                                        "${ProjectStrings.filmImagePath}${company?.logoPath}"
                                      ),
                                      Text(
                                        company?.name ?? "",
                                        style: context.textTheme().labelMedium,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
