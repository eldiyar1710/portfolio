import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_portfolio/web/download_stub.dart'
    if (dart.library.html) 'package:flutter_portfolio/web/download_web.dart';

import '../../../res/constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../view model/day_night_controller.dart';
import 'package:flutter/scheduler.dart';
import '../../../theme/gradients.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});
  @override
  Widget build(BuildContext context) {
    final mode = DayNightController.effectiveMode(SchedulerBinding.instance.platformDispatcher.platformBrightness);
    return InkWell(
      onTap: () {
        final path = 'assets/images/${Uri.encodeComponent(cvFileName)}';
        const downloadName = 'Резюме Flutter-разработчик Eldiyar Rakhmatullaev.pdf';
        downloadFile(path, downloadName);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding/1.5,horizontal: defaultPadding*2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),offset: const Offset(0, -1),blurRadius: 6),
              BoxShadow(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.10),offset: const Offset(0, 1),blurRadius: 6),
            ],
          gradient: AppGradients.primary(mode),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).t('download_cv'),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: defaultPadding/3,),
            Icon(FontAwesomeIcons.download,color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),size: 15,)

          ],
        ),
      ),
    );
  }
}
