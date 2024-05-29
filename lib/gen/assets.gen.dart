/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ImagesGen {
  const $ImagesGen();

  /// Directory path: images/png
  $ImagesPngGen get png => const $ImagesPngGen();

  /// Directory path: images/svg
  $ImagesSvgGen get svg => const $ImagesSvgGen();
}

class $ImagesPngGen {
  const $ImagesPngGen();

  /// File path: images/png/osuwari-cha-cat.png
  AssetGenImage get osuwariChaCat =>
      const AssetGenImage('images/png/osuwari-cha-cat.png');

  /// List of all assets
  List<AssetGenImage> get values => [osuwariChaCat];
}

class $ImagesSvgGen {
  const $ImagesSvgGen();

  /// File path: images/svg/account.svg
  String get account => 'images/svg/account.svg';

  /// File path: images/svg/arrow_right.svg
  String get arrowRight => 'images/svg/arrow_right.svg';

  /// File path: images/svg/nekosui.svg
  String get nekosui => 'images/svg/nekosui.svg';

  /// File path: images/svg/nyannkinng.svg
  String get nyannkinng => 'images/svg/nyannkinng.svg';

  /// List of all assets
  List<String> get values => [account, arrowRight, nekosui, nyannkinng];
}

class Assets {
  Assets._();

  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
