import 'dart:io';

import 'package:cat_sns_app/data/persistence/preferences_service.dart';
import 'package:cat_sns_app/data/service/remote_config_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

final versionCheckManagerProvider =
    Provider<VersionCheckManager>((ref) => VersionCheckManager(
          remoteConfigDataSource: ref.watch(remoteConfigDataSourceProvider),
          preferencesService: ref.watch(preferencesServiceProvider),
        ));

class VersionCheckManager {
  VersionCheckManager({
    required RemoteConfigDataSource remoteConfigDataSource,
    required PreferencesService preferencesService,
  })  : _remoteConfigDataSource = remoteConfigDataSource,
        _preferencesService = preferencesService;

  final RemoteConfigDataSource _remoteConfigDataSource;
  final PreferencesService _preferencesService;

  Future<bool> versionCheck() async {
    final currentVersion = await getCurrentVersion();
    final platformKey =
        Platform.isIOS ? 'ios_required_semver' : 'android_required_semver';
    final requiredVersion = await _remoteConfigDataSource.fetchRequiredVersion(
        currentVersion, platformKey);
    if (requiredVersion == null) {
      return false;
    }
    return Version.parse(currentVersion).compareTo(requiredVersion).isNegative;
  }

  Future<Version?> semiForcedVersionCheck() async {
    final currentVersion = await getCurrentVersion();
    final platformKey = Platform.isIOS
        ? 'ios_semi_forced_semver'
        : 'android_semi_forced_semver';
    final semiForcedVersion = await _remoteConfigDataSource
        .fetchSemiForcedVersion(currentVersion, platformKey);
    if (semiForcedVersion == null) {
      return null;
    }
    final semiForcedUpdateDialogShownVersion =
        await _preferencesService.loadSemiForcedUpdateDialogShownVersion();
    if (Version.parse(currentVersion).compareTo(semiForcedVersion).isNegative &&
        (semiForcedUpdateDialogShownVersion == null ||
            Version.parse(semiForcedUpdateDialogShownVersion) <
                semiForcedVersion)) {
      return semiForcedVersion;
    }
    return null;
  }

  Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
