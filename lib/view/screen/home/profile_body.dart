import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/profile_controller.dart';
import '../../../core/config/constants/variables.dart';
import '../../widgets/packages/cutom_card.dart';
import '../../widgets/shared/profile_image.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.transparent,
          height: Get.height * 0.02,
        ),
        GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => BigProfileImage(controller: controller)),
        const Divider(color: Colors.transparent),
        Text(
          userData[0]['user_name'],
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        Divider(
          color: Colors.transparent,
          height: Get.height * 0.05,
        ),
        CustomCard(
            width: Get.width * 0.9,
            height: Get.height * 0.25,
            color: Colors.blue[300],
            child: Column(
              children: [
                ListTile(
                  title: Text(userData[0]['user_email'],
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w400)),
                ),
                ListTile(
                  leading: Text(
                    'Date created'.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                  title: Text(userData[0]['user_date'],
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w400)),
                ),
                ListTile(
                  leading: Text(
                    'Orders Count'.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                  title: Text(userData[0]['user_orders_count'].toString(),
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w400)),
                )
              ],
            )),
      ],
    );
  }
}
