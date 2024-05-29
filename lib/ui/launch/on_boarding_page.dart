import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';
import 'package:cat_sns_app/state/notifier/on_boarding_notifier.dart';
import 'package:cat_sns_app/widget/button/app_button.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(onBoardingNotifierProvider.notifier);
    final state = ref.watch(onBoardingNotifierProvider);
    final double _deviceHeight = MediaQuery.of(context).size.height;
    // TODO: 一旦iPhone 13 miniの画面サイズをブレイクポイントに設定
    const double _breakPointHeight = 812;
    bool _isOverBreakHeight = _deviceHeight >= _breakPointHeight;

    List<Widget> _pages = [
      _page('1', '1', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight,
          isScreen: true),
      _page('2', '2', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight),
      _page('3', '3', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight,
          isFullWidth: true),
      _page('4', '', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight),
      _page('5', '5', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight),
      _page('6', '6', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight,
          isScreen: true),
      _page('7', '7', Assets.images.png.osuwariChaCat.path, _isOverBreakHeight,
          isScreen: true),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/png/on_boarding_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          PageView(
              controller: state.pageController,
              scrollDirection: Axis.horizontal,
              children: _pages,
              onPageChanged: (index) {
                notifier.updatePageState(index);
              }),
          Column(children: <Widget>[
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xE6ffffff),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _isOverBreakHeight ? 24 : 16,
                  ),
                  AppTextButton(
                    height: 56,
                    onPressed: () => notifier.pageHandling(_pages.length,
                        completePage: () => context.router
                            .replaceAll([const LoginSelectRoute()])),
                    text: AppText(
                      text: (state.pageIndex != _pages.length - 1)
                          ? '次へ'
                          : '今すぐスタート',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textWhite,
                    ),
                  ),
                  SizedBox(
                    height: _isOverBreakHeight ? 19 : 11,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(5),
                          child: const AppText(
                            text: 'スキップ',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        onTap: () {
                          context.router.replaceAll([const LoginSelectRoute()]);
                        },
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _isOverBreakHeight ? 24 : 11,
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _page(
      String title, String description, String image, bool isOverBreakHeight,
      {bool isScreen = false, bool isFullWidth = false}) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: isOverBreakHeight ? 70 : 40,
              ),
              AppText(
                text: title,
                color: AppColors.textWhite,
                fontSize: isOverBreakHeight ? 20 : 18,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                lineHeight: 1.5,
              ),
              Visibility(
                visible: description.isNotEmpty,
                child: const SizedBox(height: 8),
              ),
              Visibility(
                visible: description.isNotEmpty,
                child: AppText(
                  text: description,
                  color: AppColors.textMiddle,
                  fontSize: isOverBreakHeight ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  lineHeight: 1.5,
                ),
              ),
              SizedBox(height: isOverBreakHeight ? 24 : 16),
              SizedBox(height: isScreen ? 0 : 8),
              Visibility(
                visible: image.isNotEmpty,
                child: Container(
                  padding: isFullWidth
                      ? const EdgeInsets.symmetric(horizontal: 0)
                      : const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.topCenter,
                  height: isOverBreakHeight ? 547 : 420,
                  child: Image.asset(
                    'assets/images/png/$image',
                    fit: BoxFit.contain,
                    width: isFullWidth
                        ? double.infinity
                        : isOverBreakHeight
                            ? null
                            : 300,
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
