import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/foundation/utils/version_check_manager.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:cat_sns_app/model/enum/loggedin_type.dart';
import 'package:cat_sns_app/repository/preferences/preferences_repository.dart';
import 'package:cat_sns_app/router/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../foundation/constant/app_colors.dart';
import '../../widget/dialog/update_version_dialog.dart';

final _triggerNotifier = FutureProvider.family
    .autoDispose<LoggedInType, BuildContext>((ref, context) async {
  // Load uid from the shared preferences.
  String userId = await ref.watch(preferencesRepositoryProvider).loadUserId();

  // If the token is empty, the user is not logged in.
  // If the token is not empty, the user is logged in.
  // If the app needs to be updated, the user needs to update the app.
  LoggedInType _state =
      userId.isEmpty ? LoggedInType.notLoggedIn : LoggedInType.loggedIn;

  // Check if the app needs to be updated.
  /* final _versionCheck = ref.watch(versionCheckManagerProvider);
  final needUpdate = await _versionCheck.versionCheck();
  if (needUpdate) _state = LoggedInType.needUpdate; */

  return Future<LoggedInType>.value(_state);
});

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<LoggedInType> triggerNotifier =
        ref.watch(_triggerNotifier(context));

    triggerNotifier.whenData((LoggedInType loggedInType) {
      if (loggedInType == LoggedInType.needUpdate) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showUpdateDialog(true, context);
        });
        return;
      }
      if (loggedInType == LoggedInType.loggedIn) {
        context.replaceRoute(const DashboardRoute());
      } else {
        ref
            .watch(preferencesRepositoryProvider)
            .loadLoggedInFlag()
            .then((isLoggedIn) {
          if (loggedInType == LoggedInType.notLoggedIn && isLoggedIn) {
            context.replaceRoute(const LoginSelectRoute());
          } else {
            context.replaceRoute(const OnBoardingRoute());
          }
        });
      }
    });

    return Container(
      color: AppColors.backGround,
      padding: EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                child: Image.asset(Assets.images.png.osuwariChaCat.path)),
          ],
        ),
      ),
    );
  }
}
