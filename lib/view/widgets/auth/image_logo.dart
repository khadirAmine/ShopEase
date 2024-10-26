import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/assets.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.transparent,
          height: Get.height * 0.06,
        ),
        Image.asset(
          IconAsset.cart,
          height: 220,
        ),
        Divider(
          color: Colors.transparent,
          height: Get.height * 0.06,
        )
      ],
    );
  }
}
