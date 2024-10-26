import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../view/widgets/packages/custom_button.dart';
import '../config/constants/enums.dart';
import '../config/constants/variables.dart';

Future<bool> checkInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (!result) {
    appStatus = AppStatus.internet;
    Get.defaultDialog(
        title: 'Internet'.tr,
        content: Text('Check your Internet And retry.'.tr),
        confirm: CustomButton(
          onTap: () {
            try {
              Get.back();
            } catch (e) {
              null;
            }
          },
          withe: Get.width * 0.15,
          height: Get.height * 0.04,
          child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
        ));
  } else {
    appStatus = AppStatus.normal;
  }

  return result;
}
