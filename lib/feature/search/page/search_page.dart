import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/search/model/search_model.dart';
import 'package:film_oasis/feature/search/page/mixin/search_page_mixin.dart';
import 'package:film_oasis/feature/search/state/search_state.dart';
import 'package:film_oasis/product/constants/enum/project_elevation.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/project_textfield.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './widgets/circular_progress.dart';
part './widgets/list_search_result.dart';
part './widgets/row_date_imbd.dart';
part './widgets/text_no_search.dart';

@RoutePage()
final class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> with SearchPageMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(AppProviderItems.searchProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ProjectStrings.appbarSearch),
        ),
        body: Padding(
          padding: context.paddingHorizantalLow2,
          child: Column(
            children: [
              ProjectSearchTextField(
                controller: searchController,
                onChanged: onSearchChanged,
                onClearPressed: clearSearch,
              ),
              if (state.isLoading)
                const _CircularProgessIndicator()
              else if (state.searchModel.results?.isNotEmpty ?? false)
                _ListViewSearchResult(state: state)
              else
                const _TextNoSearch(),
            ],
          ),
        ),
      ),
    );
  }
}
