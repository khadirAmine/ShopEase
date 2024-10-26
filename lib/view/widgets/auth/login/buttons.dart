import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../packages/custom_button.dart';
import '../../packages/loading.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key, required this.controller});
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          withe: Get.width * 0.7,
          onTap: () async {
            controller.formState.currentState!.validate();
            try {
              await controller.loginFuncton();
            } catch (e) {
              null;
            }
          },
          child: Loading(
              isLoading: controller.loginLoading,
              color: Colors.white,
              size: 24,
              child: Text(
                'Login'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
      ],
    );
  }
}
