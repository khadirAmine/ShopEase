import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/verify_email_controller.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/constants/variables.dart';
import '../../packages/custom_button.dart';
import '../../shared/profile_image.dart';

class AddUserImage extends StatelessWidget {
  const AddUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        children: [
          Divider(color: Colors.transparent, height: Get.height * 0.07),
          SizedBox(
            height: Get.height * 0.195,
            child: GetBuilder<VerifyEmailController>(
                init: VerifyEmailController(),
                builder: (controller) =>
                    BigProfileImage(controller: controller)),
          ),
          Text(userData[0]['user_name'],
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Divider(
            height: Get.height * 0.09,
          ),
          Container(
            padding: EdgeInsets.only(left: Get.width * 0.09),
            width: Get.width,
            child: Text(userData[0]['user_email'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          Divider(
            height: Get.height * 0.09,
          ),
          CustomButton(
            child: Text('Continue'.tr,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            onTap: () {
              Get.offAllNamed(Routes.home);
            },
          )
        ],
      ),
    );
  }
}
