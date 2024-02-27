/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIcoGen {
  const $AssetsIcoGen();

  /// File path: assets/ico/close_menu.png
  AssetGenImage get closeMenu =>
      const AssetGenImage('assets/ico/close_menu.png');

  /// File path: assets/ico/ic_calendar.png
  AssetGenImage get icCalendar =>
      const AssetGenImage('assets/ico/ic_calendar.png');

  /// File path: assets/ico/ic_cartable_not_selected.png
  AssetGenImage get icCartableNotSelected =>
      const AssetGenImage('assets/ico/ic_cartable_not_selected.png');

  /// File path: assets/ico/ic_cartable_selected.png
  AssetGenImage get icCartableSelected =>
      const AssetGenImage('assets/ico/ic_cartable_selected.png');

  /// File path: assets/ico/ic_close_buttons.png
  AssetGenImage get icCloseButtons =>
      const AssetGenImage('assets/ico/ic_close_buttons.png');

  /// File path: assets/ico/ic_dashboard_not_selected.png
  AssetGenImage get icDashboardNotSelected =>
      const AssetGenImage('assets/ico/ic_dashboard_not_selected.png');

  /// File path: assets/ico/ic_dashboard_selected.png
  AssetGenImage get icDashboardSelected =>
      const AssetGenImage('assets/ico/ic_dashboard_selected.png');

  /// File path: assets/ico/ic_down_arrow.png
  AssetGenImage get icDownArrow =>
      const AssetGenImage('assets/ico/ic_down_arrow.png');

  /// File path: assets/ico/ic_exit.png
  AssetGenImage get icExit => const AssetGenImage('assets/ico/ic_exit.png');

  /// File path: assets/ico/ic_logout.png
  AssetGenImage get icLogout => const AssetGenImage('assets/ico/ic_logout.png');

  /// File path: assets/ico/ic_message.png
  AssetGenImage get icMessage =>
      const AssetGenImage('assets/ico/ic_message.png');

  /// File path: assets/ico/ic_open_buttons.png
  AssetGenImage get icOpenButtons =>
      const AssetGenImage('assets/ico/ic_open_buttons.png');

  /// File path: assets/ico/ic_pin_not_selected-1.png
  AssetGenImage get icPinNotSelected1 =>
      const AssetGenImage('assets/ico/ic_pin_not_selected-1.png');

  /// File path: assets/ico/ic_pin_not_selected.png
  AssetGenImage get icPinNotSelected =>
      const AssetGenImage('assets/ico/ic_pin_not_selected.png');

  /// File path: assets/ico/ic_pin_selected.png
  AssetGenImage get icPinSelected =>
      const AssetGenImage('assets/ico/ic_pin_selected.png');

  /// File path: assets/ico/ic_search.png
  AssetGenImage get icSearch => const AssetGenImage('assets/ico/ic_search.png');

  /// File path: assets/ico/ic_support_call.png
  AssetGenImage get icSupportCall =>
      const AssetGenImage('assets/ico/ic_support_call.png');

  /// File path: assets/ico/ic_support_email.png
  AssetGenImage get icSupportEmail =>
      const AssetGenImage('assets/ico/ic_support_email.png');

  /// File path: assets/ico/ic_time.png
  AssetGenImage get icTime => const AssetGenImage('assets/ico/ic_time.png');

  /// File path: assets/ico/ic_top_arrow.png
  AssetGenImage get icTopArrow =>
      const AssetGenImage('assets/ico/ic_top_arrow.png');

  /// File path: assets/ico/ic_website.png
  AssetGenImage get icWebsite =>
      const AssetGenImage('assets/ico/ic_website.png');

  /// File path: assets/ico/icon-exit.png
  AssetGenImage get iconExit => const AssetGenImage('assets/ico/icon-exit.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        closeMenu,
        icCalendar,
        icCartableNotSelected,
        icCartableSelected,
        icCloseButtons,
        icDashboardNotSelected,
        icDashboardSelected,
        icDownArrow,
        icExit,
        icLogout,
        icMessage,
        icOpenButtons,
        icPinNotSelected1,
        icPinNotSelected,
        icPinSelected,
        icSearch,
        icSupportCall,
        icSupportEmail,
        icTime,
        icTopArrow,
        icWebsite,
        iconExit
      ];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/icn_toolo_padideh.png
  AssetGenImage get icnTooloPadideh =>
      const AssetGenImage('assets/img/icn_toolo_padideh.png');

  /// File path: assets/img/img_left.png
  AssetGenImage get imgLeft => const AssetGenImage('assets/img/img_left.png');

  /// File path: assets/img/img_profile.png
  AssetGenImage get imgProfile =>
      const AssetGenImage('assets/img/img_profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [icnTooloPadideh, imgLeft, imgProfile];
}

class Assets {
  Assets._();

  static const $AssetsIcoGen ico = $AssetsIcoGen();
  static const $AssetsImgGen img = $AssetsImgGen();
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
