/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/b1.png
  AssetGenImage get b1 => const AssetGenImage('assets/png/b1.png');

  /// File path: assets/png/b2.png
  AssetGenImage get b2 => const AssetGenImage('assets/png/b2.png');

  /// File path: assets/png/b3.png
  AssetGenImage get b3 => const AssetGenImage('assets/png/b3.png');

  /// File path: assets/png/b4.png
  AssetGenImage get b4 => const AssetGenImage('assets/png/b4.png');

  /// File path: assets/png/b5.png
  AssetGenImage get b5 => const AssetGenImage('assets/png/b5.png');

  /// File path: assets/png/b6.png
  AssetGenImage get b6 => const AssetGenImage('assets/png/b6.png');

  /// List of all assets
  List<AssetGenImage> get values => [b1, b2, b3, b4, b5, b6];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/b1.svg
  String get b1 => 'assets/svg/b1.svg';

  /// File path: assets/svg/b2.svg
  String get b2 => 'assets/svg/b2.svg';

  /// File path: assets/svg/b3.svg
  String get b3 => 'assets/svg/b3.svg';

  /// File path: assets/svg/b4.svg
  String get b4 => 'assets/svg/b4.svg';

  /// File path: assets/svg/b5.svg
  String get b5 => 'assets/svg/b5.svg';

  /// File path: assets/svg/b6.svg
  String get b6 => 'assets/svg/b6.svg';

  /// File path: assets/svg/book_icon.svg
  String get bookIcon => 'assets/svg/book_icon.svg';

  /// File path: assets/svg/calendar_icon.svg
  String get calendarIcon => 'assets/svg/calendar_icon.svg';

  /// File path: assets/svg/point.svg
  String get point => 'assets/svg/point.svg';

  /// File path: assets/svg/rect_div.svg
  String get rectDiv => 'assets/svg/rect_div.svg';

  /// File path: assets/svg/stat_icon.svg
  String get statIcon => 'assets/svg/stat_icon.svg';

  /// List of all assets
  List<String> get values => [
        b1,
        b2,
        b3,
        b4,
        b5,
        b6,
        bookIcon,
        calendarIcon,
        point,
        rectDiv,
        statIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
