import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:cat_sns_app/foundation/utils/logger.dart';

final Provider<RemoteConfigDataSource> remoteConfigDataSourceProvider =
    Provider<RemoteConfigDataSource>((ref) => RemoteConfigDataSource());

class RemoteConfigDataSource {
  RemoteConfigDataSource();

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> _initialize() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 10),
    ));
    await remoteConfig.fetch();
    await remoteConfig.activate();
  }

  Future<Version?> fetchRequiredVersion(
      String appVersionStr, String platformKey) async {
    try {
      await remoteConfig.setDefaults(<String, dynamic>{
        'android_required_semver': appVersionStr,
        'ios_required_semver': appVersionStr
      });

      await _initialize();

      final requiredVersion = remoteConfig.getString(platformKey);
      return Version.parse(requiredVersion);
    } catch (e) {
      logger.severe('Error: $e');
      return null;
    }
  }

  Future<Version?> fetchSemiForcedVersion(
      String appVersionStr, String platformKey) async {
    try {
      await remoteConfig.setDefaults(<String, dynamic>{
        'android_semi_forced_semver': appVersionStr,
        'ios_semi_forced_semver': appVersionStr,
      });
      await _initialize();
      final semiForcedVersion = remoteConfig.getString(platformKey);
      return Version.parse(semiForcedVersion);
    } catch (e) {
      logger.severe('Error: $e');
      return null;
    }
  }

  Future<bool> shouldShowReviewDialog(String dialogKey) async {
    try {
      await _initialize();
      return remoteConfig.getBool(dialogKey);
    } catch (e) {
      logger.severe('Error fetching review dialog flag: $e');
      return false;
    }
  }
}
