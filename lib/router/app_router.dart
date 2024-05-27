import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /* AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: UserRegisterRoute.page),
        AutoRoute(page: ObjectAddRoute.page),
        AutoRoute(page: ObjectiveAddTaskRoute.page),
        AutoRoute(page: ObjectiveEditRoute.page),
        AutoRoute(page: ObjectRoute.page),
        AutoRoute(page: MonsterComingRoute.page),
        AutoRoute(page: ObjectiveCompleteRoute.page),
        AutoRoute(page: ChatRoute.page), */
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(page: RankingRoute.page),
            AutoRoute(
              page: AccountRoute.page,
            ),
            AutoRoute(page: SettingRoute.page),
          ],
        ),
      ];
}
