import 'dart:typed_data';

import 'app_share_impl/stub_app_share_imp.dart'
    if (dart.library.io) 'app_share_impl/mobile_app_share_impl.dart'
    if (dart.library.html) 'app_share_impl/web_app_share_impl.dart';

final class AppShare {
  const AppShare();

  Future<void> shareImage(Uint8List imageBytes, String fileName) async {
    await const AppShareImpl().shareImage(imageBytes, fileName);
  }
}
