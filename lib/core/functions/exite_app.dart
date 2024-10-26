import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/packages/custom_button.dart';

exiteApp() {
  return Get.defaultDialog(
      title: 'alert'.tr,
      middleText: 'Do you want to Exit ?'.tr,
      middleTextStyle: const TextStyle(fontSize: 19),
      titleStyle: const TextStyle(fontWeight: FontWeight.w600),
      confirm: CustomButton(
          onTap: () {
            exit(0);
          },
          color: Colors.orange,
          child: Text('Confirm'.tr,
              style: const TextStyle(fontWeight: FontWeight.w500))),
      cancel: CustomButton(
          onTap: () {
            Get.back();
          },
          color: Colors.blue,
          child: Text('Cancel'.tr,
              style: const TextStyle(fontWeight: FontWeight.w500))));
}
