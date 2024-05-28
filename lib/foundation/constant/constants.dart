import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum Flavor { dev, prod }

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
      case Flavor.prod:
        return 'https://rimawarikun.com/api/v1';
      default:
        return '';
    }
  }

  /* String deepLinkScheme() {
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
  } */

  String appleStoreUrl = 'https://apps.apple.com/jp/app/id6462055936?mt=8';
  String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.rimawarikun';

  String rimawarikunVersionHeaderKey = 'Rimawarikun-Version';
}
