import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/variables.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            Get.back();
          },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
        textDirection:
            localeValue == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      ),
    );
  }
}
