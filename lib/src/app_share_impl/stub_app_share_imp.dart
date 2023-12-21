// ignore_for_file: prefer-match-file-name, avoid-unused-parameters

import 'dart:typed_data';

final class AppShareImpl {
  const AppShareImpl();

  Future<void> shareImage(Uint8List imageBytes, String fileName) async {
    throw UnimplementedError('Unsupported platform to share image');
  }
}
