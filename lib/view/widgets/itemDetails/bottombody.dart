import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/config/constants/variables.dart';
import '../../../core/functions/add_order.dart';
import 'buy_button.dart';
import 'details_card.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({super.key, required this.controller});
  final ItemDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 197, 234, 251),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 1),
                      blurRadius: 6,
                      spreadRadius: 0.1)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description'.tr,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500)),
                const Divider(color: Colors.transparent),
                Text(
                    localeValue == 'en'
                        ? controller.itemDesc
                        : localeValue == 'ar'
                            ? controller.itemDescAr
                            : controller.itemDescFr,
                    maxLines: 5,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400)),
                const Divider(color: Colors.transparent),
                DetailsCard(controller: controller),
                const Divider(color: Colors.transparent),
                Row(children: [
                  Text.rich(
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      TextSpan(children: [
                        TextSpan(text: 'Quantity'.tr),
                        const TextSpan(text: ' : '),
                      ])),
                  IconButton(
                      onPressed: () async {
                        if (controller.orderCount <
                            int.parse(controller.itemCount)) {
                          controller.orderCount++;
                        }
                        controller.update();
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black54),
                  Text(
                    controller.orderCount.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {
                        if (controller.orderCount > 1) {
                          controller.orderCount--;
                        }
                        controller.update();
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.black54),
                ]),
                const Divider(color: Colors.transparent),
                Buybutton(onTap: () async {
                  controller.buyLoading.value = true;
                  for (int i = 0; i < controller.orderCount; i++) {
                    await addOrder(controller.itemId);
                  }
                  controller.buyLoading.value = false;
                  Get.dialog(Icon(Icons.check_circle,
                      color: Colors.greenAccent, size: size * 0.13));
                  await Future.delayed(const Duration(seconds: 1));
                  Get.back();
                }),
              ],
            )));
  }
}
