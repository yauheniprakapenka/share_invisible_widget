// ignore_for_file: prefer-match-file-name

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../constants.dart';

final class AppShareImpl {
  const AppShareImpl();

  Future<void> shareImage(Uint8List imageBytes, String fileName) async {
    final String fileNameWithExtension = '$fileName.$png';
    final String path = await _getPath(fileNameWithExtension);

    await _createFile(path, imageBytes);

    await Share.shareXFiles(
      [
        XFile(path),
      ],
    );
  }

  Future<String> _getPath(String fileName) async {
    final Directory tempDir = await getTemporaryDirectory();
    return '${tempDir.path}/$fileName';
  }

  Future<void> _createFile(String path, Uint8List imageBytes) async {
    final File file = await File(path).create();
    await file.writeAsBytes(imageBytes);
  }
}
