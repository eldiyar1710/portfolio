import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(icon: 'assets/icons/github.svg',onTap: () => launchUrl(Uri.parse('https://github.com/eldiyar1710')),),
        IconButton(onPressed: () {launchUrl(Uri.parse('$whatsappUrl?text=${Uri.encodeComponent(whatsappDefaultMessage)}'));}, icon: const Icon(FontAwesomeIcons.whatsapp,color: Colors.white,size: 16)),
      ],
    );
  }
}
