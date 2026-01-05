import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../res/constants.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        children: [
          const Spacer(),
          IconButton(onPressed: () {launchUrl(Uri.parse('https://github.com/eldiyar1710'));}, icon: SvgPicture.asset('assets/icons/github.svg')),
          IconButton(onPressed: () {launchUrl(Uri.parse('$whatsappUrl?text=${Uri.encodeComponent(whatsappDefaultMessage)}'));}, icon: const Icon(FontAwesomeIcons.whatsapp,color: Colors.white)),
          const Spacer(),
        ],
      ),
    );
  }
}
