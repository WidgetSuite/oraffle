// Facade that conditionally imports the correct implementation for the current platform.
import 'dart:typed_data';

import 'export_utils_io.dart'
    if (dart.library.html) 'export_utils_web.dart' as impl;

Future<String> downloadFile(String filename, Uint8List bytes, String mime) async {
  return await impl.downloadFile(filename, bytes, mime);
}
