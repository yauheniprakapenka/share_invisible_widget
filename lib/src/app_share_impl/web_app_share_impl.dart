// ignore_for_file: prefer-match-file-name, avoid-redundant-async

import 'dart:html' as html;
import 'dart:typed_data';

import '../constants.dart';

final class AppShareImpl {
  const AppShareImpl();

  Future<void> shareImage(Uint8List imageBytes, String fileName) async {
    final html.Blob blob = html.Blob([imageBytes], 'image/$png');
    final String url = html.Url.createObjectUrlFromBlob(blob);

    final String fileNameWithExtension = '$fileName.$png';

    html.AnchorElement(href: url)
      ..setAttribute('download', fileNameWithExtension)
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}
