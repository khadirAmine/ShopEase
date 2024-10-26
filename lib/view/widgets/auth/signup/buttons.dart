import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constants/variables.dart';
import '../../packages/custom_button.dart';
import '../../packages/loading.dart';

class SignUpButtons extends StatelessWidget {
  SignUpButtons({super.key, required this.controller});

  final Crud crud = Crud();
  final SignupController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            withe: Get.width * 0.7,
            onTap: () async {
              emailIsExists = false;
              try {
                await controller.signUp();
              } catch (e) {
                null;
              }
            },
            child: Loading(
                isLoading: controller.signUpLoading,
                size: 24,
                child: Text('Sign Up'.tr,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)))),
      ],
    );
  }
}
