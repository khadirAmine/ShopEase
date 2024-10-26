import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/launch_uri.dart';
import '../packages/custom_button.dart';

class ContactButton extends StatelessWidget {
  const ContactButton(
      {super.key,
      required this.icon,
      required this.uri,
      required this.showLink,
      required this.color});

  final String icon, showLink;
  final Uri uri;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onTap: () async {
          await launchuri(uri);
        },
        withe: Get.width,
        height: Get.height * 0.07,
        color: color,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.02,
        ),
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Image.asset(icon, width: Get.width * 0.1),
          VerticalDivider(width: Get.width * 0.02, color: Colors.transparent),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            child: Text(showLink,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16)),
          )
        ]));
  }
}
