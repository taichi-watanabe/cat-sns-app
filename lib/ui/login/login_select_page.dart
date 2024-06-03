import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';
import 'package:cat_sns_app/widget/button/app_button.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginSelectPage extends HookConsumerWidget {
  const LoginSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColorsUpdate.white,
      body: getBody(context, ref),
    );
  }

  Widget getBody(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(Assets.images.png.osuwariChaCat.path)),
            const SizedBox(
              height: 22,
            ),
            const AppText(text: 'にゃわばり'),
            const SizedBox(
              height: 118,
            ),
            AppTextButton(
                height: 64,
                text: const AppText(
                  text: 'ユーザー登録',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite,
                ),
                onPressed: () {
                  context.router.push(SignupRoute());
                },
                borderRadius: 50,
                backGroundColor: AppColors.primary),
            const SizedBox(
              height: 24,
            ),
            AppTextButton(
              height: 64,
              text: const AppText(
                text: 'ログイン',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              onPressed: () {},
              backGroundColor: AppColorsUpdate.white,
              borderColor: AppColors.primary,
              borderRadius: 50,
              borderWidth: 3,
            ),
            const SizedBox(height: 57),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                      text: "見る専の方はこちら",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColorsUpdate.gray04),
                  const SizedBox(width: 10),
                  SvgPicture.asset(Assets.images.svg.arrowRight)
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
