/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/Settings.svg');

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/character.svg
  SvgGenImage get character => const SvgGenImage('assets/icons/character.svg');

  /// File path: assets/icons/episode.svg
  SvgGenImage get episode => const SvgGenImage('assets/icons/episode.svg');

  /// File path: assets/icons/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/filter.svg');

  /// File path: assets/icons/list.svg
  SvgGenImage get list => const SvgGenImage('assets/icons/list.svg');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/passwordIcon.svg
  SvgGenImage get passwordIcon =>
      const SvgGenImage('assets/icons/passwordIcon.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/sort.svg
  SvgGenImage get sort => const SvgGenImage('assets/icons/sort.svg');

  /// File path: assets/icons/userIcon.svg
  SvgGenImage get userIcon => const SvgGenImage('assets/icons/userIcon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        settings,
        back,
        character,
        episode,
        filter,
        list,
        location,
        passwordIcon,
        search,
        sort,
        userIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/agency_director.png
  AssetGenImage get agencyDirector =>
      const AssetGenImage('assets/images/agency_director.png');

  /// File path: assets/images/alan_riles.png
  AssetGenImage get alanRiles =>
      const AssetGenImage('assets/images/alan_riles.png');

  /// File path: assets/images/albert_einstein.png
  AssetGenImage get albertEinstein =>
      const AssetGenImage('assets/images/albert_einstein.png');

  /// File path: assets/images/anatomical_park.png
  AssetGenImage get anatomicalPark =>
      const AssetGenImage('assets/images/anatomical_park.png');

  /// File path: assets/images/background_image.png
  AssetGenImage get backgroundImage =>
      const AssetGenImage('assets/images/background_image.png');

  /// File path: assets/images/earth.png
  AssetGenImage get earth => const AssetGenImage('assets/images/earth.png');

  /// File path: assets/images/home_screen_image_1.png
  AssetGenImage get homeScreenImage1 =>
      const AssetGenImage('assets/images/home_screen_image_1.png');

  /// File path: assets/images/home_screen_image_2.png
  AssetGenImage get homeScreenImage2 =>
      const AssetGenImage('assets/images/home_screen_image_2.png');

  /// File path: assets/images/home_screen_image_3.png
  AssetGenImage get homeScreenImage3 =>
      const AssetGenImage('assets/images/home_screen_image_3.png');

  /// File path: assets/images/morty_smith.png
  AssetGenImage get mortySmith =>
      const AssetGenImage('assets/images/morty_smith.png');

  /// File path: assets/images/rick_sanchez.png
  AssetGenImage get rickSanchez =>
      const AssetGenImage('assets/images/rick_sanchez.png');

  /// File path: assets/images/summer_smith.png
  AssetGenImage get summerSmith =>
      const AssetGenImage('assets/images/summer_smith.png');

  /// File path: assets/images/text_image.png
  AssetGenImage get textImage =>
      const AssetGenImage('assets/images/text_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        agencyDirector,
        alanRiles,
        albertEinstein,
        anatomicalPark,
        backgroundImage,
        earth,
        homeScreenImage1,
        homeScreenImage2,
        homeScreenImage3,
        mortySmith,
        rickSanchez,
        summerSmith,
        textImage
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
