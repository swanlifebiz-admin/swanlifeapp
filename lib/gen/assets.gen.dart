// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/audio.svg
  String get audio => 'assets/icons/audio.svg';

  /// File path: assets/icons/audio_black.svg
  String get audioBlack => 'assets/icons/audio_black.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/home_black.svg
  String get homeBlack => 'assets/icons/home_black.svg';

  /// File path: assets/icons/journal.svg
  String get journal => 'assets/icons/journal.svg';

  /// File path: assets/icons/journal_black.svg
  String get journalBlack => 'assets/icons/journal_black.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/profile_black.svg
  String get profileBlack => 'assets/icons/profile_black.svg';

  /// List of all assets
  List<String> get values => [
    audio,
    audioBlack,
    home,
    homeBlack,
    journal,
    journalBlack,
    profile,
    profileBlack,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/affirmation_card.png
  AssetGenImage get affirmationCard =>
      const AssetGenImage('assets/images/affirmation_card.png');

  /// File path: assets/images/hand_hat.png
  AssetGenImage get handHat =>
      const AssetGenImage('assets/images/hand_hat.png');

  /// File path: assets/images/hero_cliff.png
  AssetGenImage get heroCliff =>
      const AssetGenImage('assets/images/hero_cliff.png');

  /// File path: assets/images/hero_lifestyle.png
  AssetGenImage get heroLifestyle =>
      const AssetGenImage('assets/images/hero_lifestyle.png');

  /// File path: assets/images/primary.png
  AssetGenImage get primary => const AssetGenImage('assets/images/primary.png');

  /// File path: assets/images/shop_lifestyle.png
  AssetGenImage get shopLifestyle =>
      const AssetGenImage('assets/images/shop_lifestyle.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/swan_life_guide.png
  AssetGenImage get swanLifeGuide =>
      const AssetGenImage('assets/images/swan_life_guide.png');

  /// File path: assets/images/yoga_guide.png
  AssetGenImage get yogaGuide =>
      const AssetGenImage('assets/images/yoga_guide.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    affirmationCard,
    handHat,
    heroCliff,
    heroLifestyle,
    primary,
    shopLifestyle,
    splash,
    swanLifeGuide,
    yogaGuide,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
