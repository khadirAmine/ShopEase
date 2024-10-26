import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../packages/cutom_card.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.controller});

  final ItemDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        color: const Color.fromARGB(255, 167, 223, 247),
        height: Get.height * 0.1,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05, vertical: Get.height * 0.009),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price'.tr,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
                Text('Discount'.tr,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
                Text('Count'.tr,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            ),
            const Divider(color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                    TextSpan(children: [
                      const TextSpan(
                          text: '\$', style: TextStyle(color: Colors.red)),
                      TextSpan(text: controller.itemPrice)
                    ])),
                Text.rich(
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                    TextSpan(children: [
                      TextSpan(text: controller.itemDiscount),
                      const TextSpan(
                          text: '%', style: TextStyle(color: Colors.red))
                    ])),
                Text(controller.itemCount,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ));
  }
}
