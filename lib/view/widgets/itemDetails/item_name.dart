import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/config/constants/variables.dart';

class ItemName extends StatelessWidget {
  const ItemName({super.key, required this.controller});
  final ItemDetailsController controller;
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.centerLeft,
        padding:
            EdgeInsets.only(left: Get.width * 0.09, top: Get.height * 0.03),
        child: Column(
          children: [
            Text(
                localeValue == 'en'
                    ? controller.itemName
                    : localeValue == 'ar'
                        ? controller.itemNameAr
                        : controller.itemNameFr,
                style:
                    const TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
