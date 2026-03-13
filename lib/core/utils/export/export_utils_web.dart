// Web implementation for downloading a file
import 'dart:typed_data';
import 'dart:html' as html;

Future<String> downloadFile(String filename, Uint8List bytes, String mime) async {
  final blob = html.Blob([bytes], mime);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement;
  anchor.href = url;
  anchor.download = filename;
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  html.Url.revokeObjectUrl(url);
  return url;
}
