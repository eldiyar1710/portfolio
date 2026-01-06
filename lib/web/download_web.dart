import 'dart:html' as html;

void downloadFile(String path, String downloadName) {
  final a = html.AnchorElement(href: path);
  a.setAttribute('download', downloadName);
  a.click();
}

