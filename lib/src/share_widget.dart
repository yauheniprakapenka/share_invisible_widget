import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'app_share.dart';

/// Sharing invisible scrollable widget for Android, iOS and web.
///
/// Errors when working with the function [shareIvisibleWidgetAsImage]:
///
/// - `View.of() was called with a context that does not contain a View widget`.
///
/// The error of `screenshot` package v2.1.0 (https://github.com/SachinGanesh/screenshot/issues/153).
/// It does not affect the correct operation, just ignore it.
///
/// - `Expected a value of type 'JavaScriptObject', but got one of type 'Null'`.
///
/// Means that the passed widget or it's child widgets in the [invisibleWidget] parameter don't specified height or width.
/// It's necessary to check the passed widget for the width and height of the widgets.
Future<void> shareInvisibleWidgetAsImage({
  required BuildContext context,
  required String fileName,

  /// A widget that is not displayed on the screen and needs to be shared.
  ///
  /// Restricts:
  ///
  /// - Some widgets don't work, for example, Scaffold widget.
  ///
  /// - Some properties don't work, for example, `Row` doesn't work with `mainAxisAlignment` property,
  /// use `Spacer` instead.
  required Widget invisibleWidget,
}) async {
  final Uint8List imageBytes = await ScreenshotController().captureFromLongWidget(
    context: context,
    InheritedTheme.captureAll(context, invisibleWidget),
    pixelRatio: 3,
  );

  await const AppShare().shareImage(imageBytes, fileName);
}
