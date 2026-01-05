import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageViewer {
  ImageViewer(BuildContext context, String image) {
    final provider = AssetImage(image);
    precacheImage(provider, context).then((_) {
      showGeneralDialog(
        barrierColor: Colors.black87,
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: true,
        barrierLabel: 'Barrier',
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Center(
                    child: PhotoView(imageProvider: provider),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть изображение')),
      );
    });
  }
}
