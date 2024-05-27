import 'package:auto_route/auto_route.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* return ref.watch(accessTokenProvider).when(
          data: ((uuid) {
            if (uuid!.isEmpty) {
              return const UserRegisterPage();
            } else {
              return _body(ref, uuid);
            }
          }),
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ); */
    return _body(ref);
  }

  Widget _body(WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "ねこ吸い",
            fontSize: 20,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center());
  }
}
