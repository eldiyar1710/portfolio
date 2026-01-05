import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/day_night_controller.dart';
import 'package:flutter/scheduler.dart';
import '../../../theme/gradients.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = DayNightController.effectiveMode(SchedulerBinding.instance.platformDispatcher.platformBrightness);
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('$whatsappUrl?text=${Uri.encodeComponent(whatsappDefaultMessage)}'));
        },
        borderRadius: BorderRadius.circular(defaultPadding +10),
        child: Container(
          height: 60,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding),
              gradient: AppGradients.primary(mode),
            boxShadow: [
              BoxShadow(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),offset: const Offset(0, -1),blurRadius: defaultPadding/4),
              BoxShadow(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.10),offset: const Offset(0, 1),blurRadius: defaultPadding/4),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.whatsapp,color: Colors.greenAccent,size: 15,),
              const SizedBox(width : defaultPadding/4),
              Text('Whatsapp',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold
              ),),
            ],
          )
        ),
      ),
    );
  }
}
