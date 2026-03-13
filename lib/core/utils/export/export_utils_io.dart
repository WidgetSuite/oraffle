// IO implementation for downloading/saving a file on non-web platforms
import 'dart:typed_data';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<String> downloadFile(String filename, Uint8List bytes, String mime) async {
  try {
    io.Directory? targetDir;
    try {
      targetDir = await getDownloadsDirectory();
    } catch (_) {
      // getDownloadsDirectory may not be implemented on all platforms
      targetDir = null;
    }

    if (targetDir == null) {
      targetDir = await getTemporaryDirectory();
    }

    final file = io.File(p.join(targetDir.path, filename));
    await file.writeAsBytes(bytes);
    return file.path;
  } catch (e) {
    rethrow;
  }
}
