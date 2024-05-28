import 'package:cat_sns_app/foundation/constant/constants.dart';
import 'package:cat_sns_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: Constants.of().supabaseUrl(),
      anonKey: Constants.of().supabaseAnonkey());

  await initializeDateFormatting('ja_JP').then(
    (_) {
      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
  );
}

final _appRouter = AppRouter();

class MyApp extends HookConsumerWidget with WidgetsBindingObserver {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      routerConfig: _appRouter.config(),
      title: 'Cat sns',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
