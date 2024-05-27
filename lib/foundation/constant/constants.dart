/* import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum Flavor { dev, stg, prod }

@immutable
class Constants {
  Constants._internal();

  factory Constants.of() => _instance;
  static final Constants _instance = Constants._internal();

  final Flavor? _flavor = EnumToString.fromString(
    Flavor.values,
    const String.fromEnvironment('FLAVOR'),
  );

  Flavor? get flavor => _flavor;

  String baseUrl() {
    switch (_flavor) {
      case Flavor.dev:
        return 'https://dev03.syla-funding.jp/api/v1';
      case Flavor.stg:
        return 'https://rimawarikun.com/api/v1';
      case Flavor.prod:
        return 'https://rimawarikun.com/api/v1';
      default:
        return '';
    }
  }

  String preRenewalWebUrl() {
    switch (_flavor) {
      case Flavor.dev:
        return 'https://dev03.syla-funding.jp';
      case Flavor.stg:
        return 'https://rimawarikun.com';
      case Flavor.prod:
        return 'https://rimawarikun.com';
      default:
        return '';
    }
  }

  String postRenewalWebUrl() {
    switch (_flavor) {
      case Flavor.dev:
        return 'https://web-dev01.rimawarikun.com';
      case Flavor.stg:
        return 'https://web.rimawarikun.com';
      case Flavor.prod:
        return 'https://web.rimawarikun.com';
      default:
        return '';
    }
  }

  /* TRUSTDOCK SDKトークン */
  String nativeAppSdkToken() {
    switch (_flavor) {
      case Flavor.dev:
        return '6W3SAMJ33xUuczP4r7427tsW';
      case Flavor.stg:
        return '6W3SAMJ33xUuczP4r7427tsW';
      case Flavor.prod:
        return '1AhK1YYaBqeHPoj5d5rReh64';
      default:
        return '6W3SAMJ33xUuczP4r7427tsW';
    }
  }

  String deepLinkScheme() {
    switch (_flavor) {
      case Flavor.dev:
        return 'rimawarikun.dev://';
      case Flavor.stg:
        return 'rimawarikun.stg://';
      case Flavor.prod:
        return 'rimawarikun.prod://';
      default:
        return '';
    }
  }

  String adjustDeepLinkScheme() {
    switch (_flavor) {
      case Flavor.dev:
        return 'wxba.adj.st';
      case Flavor.stg:
        return '66ma.adj.st';
      case Flavor.prod:
        return '66ma.adj.st';
      default:
        return '';
    }
  }

  String adjustToken() {
    switch (_flavor) {
      case Flavor.dev:
        return 'y8swhx986fwg';
      case Flavor.stg:
        return '';
      case Flavor.prod:
        return '9g4b0t84d79c';
      default:
        return '';
    }
  }

  String appleStoreUrl = 'https://apps.apple.com/jp/app/id6462055936?mt=8';
  String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.rimawarikun';

  // TRUSTDOCK 身分証明書撮影用プランID
  String idPhotoPlanId() {
    switch (_flavor) {
      case Flavor.dev:
        return '65a8aad0-4dee-49e5-b8e8-42c9d8b8268c';
      case Flavor.stg:
        return '';
      case Flavor.prod:
        return '90a86533-cd1f-4946-9aab-54368a67c15d';
      default:
        return '';
    }
  }

  // TRUSTDOCK 身分証明書撮影用プランID
  String myNumberCardIcChipPlanId() {
    switch (_flavor) {
      case Flavor.dev:
        return '29b6350b-1abe-48a6-a1ba-3d8aa204893a';
      case Flavor.stg:
        return '';
      case Flavor.prod:
        return '31c246fd-4594-43cb-8346-618eb83a3ac1';
      default:
        return '';
    }
  }

  // TRUSTDOCKの要件が基準に満たないため使用しない　UI上で非表示にしている
  // TRUSTDOCK 運転免許証ICチップ読み取り用プランID
  String driversLicenseIcChipPlanId() {
    switch (_flavor) {
      case Flavor.dev:
        return 'd0118920-31c8-4db3-8e98-5c77a81b2eb3';
      case Flavor.stg:
        return '';
      case Flavor.prod:
      default:
        return '';
    }
  }

  // TRUSTDOCKの要件が基準に満たないため使用しない　UI上で非表示にしている
  // TRUSTDOCK セルフィー確認業務（SDK）
  String selfiePlanId() {
    switch (_flavor) {
      case Flavor.dev:
        return '40ee8a14-5b5d-47e1-8afd-cc14ab05703b';
      case Flavor.stg:
        return '';
      case Flavor.prod:
      default:
        return '';
    }
  }

  String rimawarikunVersionHeaderKey = 'Rimawarikun-Version';

  String sentryEnvironment() {
    switch (_flavor) {
      case Flavor.dev:
        return 'Development';
      case Flavor.stg:
        return 'Staging';
      case Flavor.prod:
        return 'Production';
      default:
        return '';
    }
  }
}
 */