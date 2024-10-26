import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetails_controller.dart';
import '../../../core/constants/variables.dart';
import '../packages/custom_button.dart';
import '../packages/loading.dart';

class Buybutton extends StatelessWidget {
  const Buybutton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onTap: onTap,
        withe: Get.width * 0.6,
        margin: EdgeInsets.only(left: Get.width * 0.18),
        child: GetBuilder<ItemDetailsController>(
            init: ItemDetailsController(),
            builder: (controller) => Loading(
                  isLoading: controller.buyLoading,
                  size: size * 0.04,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add To Bag'.tr,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      const VerticalDivider(color: Colors.transparent),
                      const Icon(Icons.local_mall_outlined, color: Colors.white)
                    ],
                  ),
                )));
  }
}
