import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/constants/variables.dart';
import '../../packages/custom_textformfield.dart';

Widget inputTextSignupPage(
  Key formState,
  SignupController controller,
) =>
    Center(
      child: Form(
          key: formState,
          child: Column(children: [
            CustomTextFormField(
              suffixIcon: const Icon(Icons.person),
              labelText: 'username'.tr,
              controller: controller.textEditingControllerUsername,
              focusNode: controller.focusNodeUsername,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'is Empty'.tr;
                } else if (p0.length < 4) {
                  return 'username is short'.tr;
                }
                {
                  return null;
                }
              },
              onTapOutside: (p0) {
                controller.focusNodeUsername.unfocus();
              },
            ),
            Divider(
              color: Colors.transparent,
              height: Get.height * 0.03,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                  suffixIcon: const Icon(Icons.email),
                  controller: controller.textEditingControllerEmail,
                  labelText: 'email'.tr,
                  focusNode: controller.focusNodeEmail,
                  onTapOutside: (p0) {
                    controller.focusNodeEmail.unfocus();
                  },
                  onChanged: (value) {
                    emailIsExists = false;
                  },
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'is Empty'.tr;
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(p0)) {
                      return "Invalid Email".tr;
                    } else if (emailIsExists) {
                      return 'Email already exists'.tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            )),
            Divider(
              color: Colors.transparent,
              height: Get.height * 0.03,
            ),
            GetBuilder<SignupController>(
                init: SignupController(),
                builder: (controller) => CustomTextFormField(
                    controller: controller.textEditingControllerPassword,
                    labelText: 'password'.tr,
                    focusNode: controller.focusNodePassword,
                    onTapOutside: (p0) {
                      controller.focusNodePassword.unfocus();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'is Empty'.tr;
                      } else if (p0.length < 8) {
                        return 'password is short'.tr;
                      } else {
                        return null;
                      }
                    },
                    obscureText: controller.passwordIsVisible,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.passwordIsVisible =
                              !controller.passwordIsVisible;
                          controller.update();
                        },
                        icon: controller.passwordIsVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))))
          ])),
    );
