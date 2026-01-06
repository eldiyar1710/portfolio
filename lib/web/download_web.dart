import 'dart:html' as html;

Future<void> downloadFile(String path, String downloadName, {String? fallbackPath}) async {
  String target = path;
  try {
    await html.HttpRequest.request(target, method: 'HEAD');
  } catch (_) {
    if (fallbackPath != null) {
      target = fallbackPath;
    }
  }
  final a = html.AnchorElement(href: target);
  a.setAttribute('download', downloadName);
  a.click();
  html.window.open(target, '_blank');
}
