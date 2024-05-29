import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/persistence/preferences_service.dart';

final Provider<PreferencesRepository> preferencesRepositoryProvider =
    Provider<PreferencesRepository>((ref) => PreferencesRepository(
        preferencesService: ref.watch(preferencesServiceProvider)));

class PreferencesRepository {
  PreferencesRepository({required PreferencesService preferencesService})
      : _preferencesService = preferencesService;

  final PreferencesService _preferencesService;
  Future<String?> loadFcmToken() async =>
      await _preferencesService.loadFcmToken();
  Future<bool> saveFcmToken(String id) async =>
      await _preferencesService.saveFcmToken(id);
  Future<bool> clear() => _preferencesService.clear();
  Future<String> loadUserId() => _preferencesService.loadUserId();
  Future saveUserId(String id) => _preferencesService.saveUserId(id);
  Future<bool> loadLoggedInFlag() async =>
      await _preferencesService.loadLoggedInFlag();
  Future saveLoggedInFlag(bool flag) async =>
      await _preferencesService.saveLoggedInFlag(flag);
  Future<String?> loadSemiForcedUpdateDialogShownVersion() async =>
      await _preferencesService.loadSemiForcedUpdateDialogShownVersion();
  Future saveSemiForcedUpdateDialogShownVersion(String version) async =>
      await _preferencesService.saveSemiForcedUpdateDialogShownVersion(version);
}
