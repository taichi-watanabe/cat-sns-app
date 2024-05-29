// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:cat_sns_app/dashboard_page.dart' as _i8;
import 'package:cat_sns_app/ui/account/account_page.dart' as _i5;
import 'package:cat_sns_app/ui/home/home_page.dart' as _i1;
import 'package:cat_sns_app/ui/launch/on_boarding_page.dart' as _i3;
import 'package:cat_sns_app/ui/launch/splash_page.dart' as _i4;
import 'package:cat_sns_app/ui/login/login_select_page.dart' as _i7;
import 'package:cat_sns_app/ui/ranking/ranking_page.dart' as _i2;
import 'package:cat_sns_app/ui/setting/setting_page.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    RankingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RankingPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnBoardingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AccountPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SettingPage(),
      );
    },
    LoginSelectRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginSelectPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RankingPage]
class RankingRoute extends _i9.PageRouteInfo<void> {
  const RankingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RankingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnBoardingPage]
class OnBoardingRoute extends _i9.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AccountPage]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginSelectPage]
class LoginSelectRoute extends _i9.PageRouteInfo<void> {
  const LoginSelectRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginSelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSelectRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DashboardPage]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
