import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Provider<PreferencesService> preferencesServiceProvider =
    Provider<PreferencesService>((_) => PreferencesService());

class PreferencesService {
  // ignore: constant_identifier_names
  static const String KEY_ACCESS_TOKEN = 'access_token';
  static const String KEY_USER_ID = 'user_id';
  static const String KEY_FCM_TOKEN = 'fcm_token';
  static const String KEY_LOGGEDIN_FLAG = 'loggedin_flag';
  static const String keySemiForcedUpdateDialogShownVersion =
      'semi_forced_update_dialog_shown_version';

  Future<bool> loadLoggedInFlag() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(KEY_LOGGEDIN_FLAG) ?? false;
  }

  Future saveLoggedInFlag(bool flag) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(KEY_LOGGEDIN_FLAG, flag);
  }

  Future<String> loadUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_ID) ?? '';
  }

  Future saveUserId(String id) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_USER_ID, id);
  }

  // fcm token を送信する際に使用する
  Future<String?> loadFcmToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_FCM_TOKEN);
  }

  Future<bool> saveFcmToken(String id) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_FCM_TOKEN, id);
  }

  Future<bool> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }

  Future<String?> loadSemiForcedUpdateDialogShownVersion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(keySemiForcedUpdateDialogShownVersion);
  }

  Future saveSemiForcedUpdateDialogShownVersion(String version) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(keySemiForcedUpdateDialogShownVersion, version);
  }
}
