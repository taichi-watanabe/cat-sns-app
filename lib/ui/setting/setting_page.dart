import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';
import 'package:cat_sns_app/state/notifier/lauch/login_notifier.dart';
import 'package:cat_sns_app/state/user_id.dart';
import 'package:cat_sns_app/ui/login/login_select_page.dart';
import 'package:cat_sns_app/widget/button/app_button.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userIdProvider).when(
          data: ((uid) {
            if (uid.isEmpty) {
              return const LoginSelectPage();
            } else {
              return _body(context, ref, uid);
            }
          }),
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  Widget _body(BuildContext context, WidgetRef ref, String uid) {
    return Scaffold(
        backgroundColor: AppColors.backGroundLight,
        appBar: AppBar(
          title: const AppText(
            text: "お世話",
            color: AppColorsUpdate.black01,
            fontSize: 20,
          ),
          //backgroundColor: AppColor.appMainColor,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //基本情報
                _listSectionHeader('基本情報'),
                _listColumn(_infomationList(), ref: ref),
                _listSectionHeader('サポート'),
                _listColumn(_supportList(context, ref), ref: ref),
                AppTextButton(
                    onPressed: () async {
                      // ログアウト処理
                      await ref.watch(loginNotifierProvider.notifier).logout();
                      context.router.replaceAll([const SplashRoute()]);
                    },
                    text: AppText(
                      text: 'ログアウト',
                    ))
              ],
            ),
          ),
        ));
  }

  Widget _listSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
      child: AppText(
        text: title,
        fontSize: 12,
        color: AppColors.textLight,
      ),
    );
  }

  Widget _listColumn(
    List<_AccountListItem> item, {
    bool useBottomMargin = false,
    required WidgetRef ref,
  }) {
    return Container(
      margin:
          useBottomMargin ? const EdgeInsets.only(bottom: 27) : EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: AppColors.backGround,
        border: Border(
          top: BorderSide(
            color: AppColors.borderMiddle,
          ),
          bottom: BorderSide(color: AppColors.borderMiddle),
        ),
      ),
      child: Column(
        children: List.generate(
          item.length,
          (index) => InkWell(
            onTap: () async {
              var _item = item[index];

              final onTapCallBack = item[index].onTapCallBack;
              final url = item[index].urlPath;

              if (onTapCallBack != null) {
                onTapCallBack();
              } else {
                /*if (url != null) {
                  // if (_item.isExternalUrl) {
                  //   return await launchUrl(url,
                  //       mode: LaunchMode.externalApplication);
                  // }

                  if (url.contains(Strings.internalUrl)) {
                    // 利回りくんのページはWebViewで遷移
                    router.push(WebviewRoute(
                        title: item[index].title,
                        appUrl: url,
                        needLogin:
                            (item[index].requiredUserStatus?.index ?? 0) > 0));
                  } else if (url == '') {
                    return;
                  } else {
                    // それ以外は外部ブラウザ起動
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                }*/
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: SvgPicture.asset(
                    item[index].icon,
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: index != item.length - 1
                          ? const Border(
                              bottom: BorderSide(color: AppColors.borderMiddle),
                            )
                          : null,
                    ),
                    height: 56,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text: item[index].title,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: SvgPicture.asset(
                            Assets.images.svg.arrowForward,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// 基本情報
  List<_AccountListItem> _infomationList() => [
        _AccountListItem(
            title: 'にゃわばりについて',
            icon: Assets.images.svg.iconNote,
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'アプリの使い方',
            icon: Assets.images.svg.iconInvestorInformation,
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'レビューで応援する',
            icon: Assets.images.svg.event,
            onTapCallBack: () => null),
      ];

// サポート
  List<_AccountListItem> _supportList(BuildContext context, WidgetRef ref) => [
        _AccountListItem(
          title: 'お問い合わせ（チャット）',
          icon: Assets.images.svg
              .iconInformation, /* onTapCallBack: () => context.router.push(ChatRoute()) */
        ),
        _AccountListItem(
            title: 'お問い合わせ（メール）',
            icon: Assets.images.svg.iconMail,
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'プライバシーポリシー',
            icon: Assets.images.svg.iconPrivacy,
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'バージョンアップ情報',
            icon: Assets.images.svg.iconVersion,
            onTapCallBack: () => null),
      ];
}

class _AccountListItem {
  _AccountListItem({
    required this.title,
    required this.icon,
    this.onTapCallBack,
    this.urlPath,
  });
  final String title;
  final String icon;
  final VoidCallback? onTapCallBack;
  final String? urlPath;
}
