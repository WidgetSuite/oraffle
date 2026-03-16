// Facade that conditionally imports the correct implementation for the current platform.
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

Future<String> downloadFile(String filename, Uint8List bytes, String mime) =>
    FileSaver.instance.saveFile(
      name: filename,
      bytes: bytes,
      customMimeType: mime,
    );
