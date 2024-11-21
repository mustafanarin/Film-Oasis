import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/home/model/now_showing_model.dart';
import 'package:film_oasis/feature/home/model/popular_film_model.dart';
import 'package:film_oasis/feature/home/page/home/mixin/home_page_mixin.dart';
import 'package:film_oasis/feature/home/provider/theme_provider.dart';
import 'package:film_oasis/feature/home/state/now_showing_state.dart';
import 'package:film_oasis/feature/home/state/popular_films_state.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:film_oasis/product/widgets/cached_network_image.dart';
import 'package:film_oasis/product/widgets/genre_chips.dart';
import 'package:film_oasis/product/widgets/project_button.dart';
import 'package:film_oasis/product/widgets/release_date_text.dart';
import 'package:film_oasis/product/widgets/text_film_imbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './widgets/app_bar.dart';
part './widgets/list_now_showing.dart';
part './widgets/popular_films.dart';
part './widgets/title_and_seemore_button.dart';

@RoutePage()
final class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with HomePageMixin, AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    final nowShowing = nowShowingState;
    final popularFilms = popularFilmsState;

    return Scaffold(
      appBar: const _AppbarHomePage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllLow2,
          child: Column(
            children: [
              _RowTitleAndButton(
                title: ProjectStrings.showingTitle,
                onPressed: () => navigateToNowShowing(context),
              ),
              _ListViewNowShowing(nowShowing: nowShowing),
              _RowTitleAndButton(
                title: ProjectStrings.popularTitle,
                onPressed: () => navigateToPopular(context),
              ),
              _PopularFilmsSection(popularFilms: popularFilms),
            ],
          ),
        ),
      ),
    );
  }
}