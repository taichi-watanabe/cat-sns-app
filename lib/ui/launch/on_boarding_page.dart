/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';


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
      _page('社会貢献・地域創生・夢を応援', '利回りくんだけのプロジェクトが\nたくさんあります。',
          'on_boarding_2x_01.png', _isOverBreakHeight,
          isScreen: true),
      _page(
          '銀行よりも断然増える！',
          '貯金ならほとんど増えない資産でも\n利回りくんなら好きな事業を応援しながら\n資産形成することができます。',
          'on_boarding_2x_02.png',
          _isOverBreakHeight),
      _page('あなたの資産運用で\n誰かの夢を応援できる', '資産運用をしながら社会貢献・地域創生を実現',
          'on_boarding_2x_03.png', _isOverBreakHeight,
          isFullWidth: true),
      _page('不動産投資を\n1万円からオンラインで完結', '', 'on_boarding_2x_04.png',
          _isOverBreakHeight),
      _page(
          '楽天ポイントがザクザク貯まる！',
          '楽天IDと連携することで出資額に応じて\n楽天ポイントをGet！\n投資の総合利回りが更に向上！',
          'on_boarding_2x_05.png',
          _isOverBreakHeight),
      _page('アプリで手軽にチェック', 'プッシュ通知でお得なキャンペーンや、\nファンド情報を見逃さない！',
          'on_boarding_2x_06.png', _isOverBreakHeight,
          isScreen: true),
      _page('登録は5分で完了', '面倒な本人確認はアプリで完結\n登録後はすぐにアプリが使えます',
          'on_boarding_2x_07.png', _isOverBreakHeight,
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
                // イベントトラッキング
                ref.read(analyticsManagerProvider).logEvent(
                  FirebaseAnalyticsEvent.onboardingPageViewed,
                  parameters: {
                    'page_index': index,
                  },
                );
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
                        completePage: () => router
                            .replaceAll([LoginRoute(useLaunchPage: true)])),
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
                    Container(
                      // alignment: Alignment.centerLeft,
                      child: _pageIndicator(
                          state.pageIndex, _pages.length, context, ref),
                    ),
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
                          router.replaceAll([LoginRoute(useLaunchPage: true)]);
                          ref.read(analyticsManagerProvider).logEvent(
                              FirebaseAnalyticsEvent.onboardingSkipped,
                              parameters: {
                                'page_index': state.pageIndex,
                              });
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

  Widget _pageIndicator(int pageCount, int pageLength, context, WidgetRef ref) {
    if (pageCount == pageLength - 2) {
      // 通知許可のダイアログを表示
      useFuture(useMemoized((() async {
        Future.delayed(const Duration(milliseconds: 500), (() async {
          // 通知が許可されている場合は表示しない
          var _isGranted = await Permission.notification.status.isGranted;
          if (_isGranted) {
            ref.read(analyticsManagerProvider).logEvent(
                FirebaseAnalyticsEvent.onboardingNotificationAlreadyGranted);
            return;
          }
          showCustomDialog(context, const PushNotification());
          ref.read(analyticsManagerProvider).logEvent(
              FirebaseAnalyticsEvent.onboardingNotificationPopupShown);
        }));
        return null;
      })));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(pageLength, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 8, left: 8),
          decoration: BoxDecoration(
              color: (index == pageCount)
                  ? AppColors.primary
                  : AppColors.secondary[100],
              shape: BoxShape.circle),
        );
      }),
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
 */