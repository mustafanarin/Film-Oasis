import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: SeeMoreRoute.page),
        AutoRoute(page: TabbarRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FavoritesRoute.page),
      ];
}
