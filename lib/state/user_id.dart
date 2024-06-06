import 'package:cat_sns_app/repository/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_id.g.dart';

@riverpod
Future<String> userId(UserIdRef ref) async {
  return await ref.watch(preferencesRepositoryProvider).loadUserId();
}
