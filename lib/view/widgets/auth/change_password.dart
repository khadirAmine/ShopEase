import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/reset_password_controller.dart';
import '../packages/custom_button.dart';
import '../packages/custom_textformfield.dart';
import '../packages/loading.dart';

final ResetPasswordController controller = Get.put(ResetPasswordController());

changePasswordDialoge(String email) => Get.defaultDialog(
    onWillPop: () {
      return Future.value(false);
    },
    content: GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        builder: (controller) => SizedBox(
            width: Get.width,
            height: Get.height * 0.28,
            child: Column(children: [
              Text('Enter a new password for\n change your password.'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.black54)),
              Divider(color: Colors.transparent, height: Get.height * 0.03),
              Form(
                  key: controller.formStatekey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.textEditingControllerPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'is Empty'.tr;
                          } else if (value.length < 8) {
                            return 'password is short'.tr;
                          }
                          return null;
                        },
                        maxWidth: Get.width * 0.65,
                        labelText: 'password'.tr,
                        suffixIcon: const Icon(Icons.password),
                      ),
                      const Divider(),
                      CustomTextFormField(
                        controller: controller.textEditingControllerRePassword,
                        validator: (value) {
                          if (value !=
                              controller.textEditingControllerPassword.text) {
                            return 'Invalid password'.tr;
                          }

                          return null;
                        },
                        obscureText: controller.passwordIsVisible,
                        maxWidth: Get.width * 0.65,
                        labelText: 'Re Enter password'.tr,
                        suffixIcon: controller.passwordIsVisible
                            ? IconButton(
                                onPressed: () {
                                  controller.passwordIsVisible =
                                      !controller.passwordIsVisible;
                                  controller.update();
                                },
                                icon: const Icon(Icons.visibility))
                            : IconButton(
                                onPressed: () {
                                  controller.passwordIsVisible =
                                      !controller.passwordIsVisible;
                                  controller.update();
                                },
                                icon: const Icon(Icons.visibility_off)),
                      )
                    ],
                  ))
            ]))),
    title: 'Change Password'.tr,
    cancel: CustomButton(
        onTap: () async {
          try {
            await controller.changePassword(email);
          } catch (e) {
            null;
          }
        },
        color: Colors.orange,
        child: Loading(
            isLoading: controller.changeLoading,
            color: Colors.white,
            size: 24,
            child: Text('Change'.tr,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)))),
    confirm: CustomButton(
        onTap: () {
          controller.textEditingControllerPassword.clear();
          controller.textEditingControllerRePassword.clear();
          Get.back();
          Get.back();
        },
        child: Text('Cancel'.tr,
            style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))));
