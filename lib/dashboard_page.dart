// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        RankingRoute(),
        AccountRoute(),
        SettingRoute()
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            backgroundColor: AppColors.backGround,
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              showSelectedLabels: true,
              selectedFontSize: 10,
              selectedItemColor: AppColors.primary,
              selectedIconTheme: const IconThemeData(color: AppColors.primary),
              selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.primary),
              showUnselectedLabels: true,
              unselectedFontSize: 10,
              unselectedItemColor: AppColors.blueGrey,
              unselectedIconTheme:
                  const IconThemeData(color: AppColors.blueGrey),
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: [
                _bottomNavitaionItem('assets/images/svg/home.svg', 'ねこ吸い', 0,
                    tabsRouter.activeIndex),
                _bottomNavitaionItem('assets/images/svg/fund_search.svg',
                    'にゃわばり', 1, tabsRouter.activeIndex),
                _bottomNavitaionItem('assets/images/svg/apply_fund.svg', '召使い',
                    2, tabsRouter.activeIndex),
                _bottomNavitaionItem('assets/images/svg/myfund.svg', 'お世話', 3,
                    tabsRouter.activeIndex),
              ],
            ));
      },
    );
  }

  BottomNavigationBarItem _bottomNavitaionItem(
    String? asset,
    String? label,
    int? index,
    int? currentIndex,
  ) {
    return BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SvgPicture.asset(
                asset ?? '',
                width: 20,
                height: 20,
                color: currentIndex == index
                    ? AppColors.primary
                    : AppColors.blueGrey,
              ),
            ),
          ],
        ),
        label: label);
  }
}
