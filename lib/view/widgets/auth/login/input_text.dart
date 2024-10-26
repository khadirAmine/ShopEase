import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../../core/constants/variables.dart';
import '../../packages/custom_textformfield.dart';
import 'login_bottomsheet.dart';

Widget inputTextLoginPage(
  LoginController controller,
) =>
    Center(
      child: Form(
          key: controller.formState,
          child: Column(children: [
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
                    emailIsExists = true;
                  },
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'is Empty'.tr;
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(p0)) {
                      return "Invalid Email".tr;
                    } else if (!emailIsExists) {
                      return 'email is not Exists'.tr;
                    }

                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            )),
            Divider(
              color: Colors.transparent,
              height: Get.height * 0.05,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextFormField(
                      controller: controller.textEditingControllerPassword,
                      labelText: 'password'.tr,
                      focusNode: controller.focusNodePassword,
                      onTapOutside: (p0) {
                        controller.focusNodePassword.unfocus();
                      },
                      onChanged: (value) {
                        passwordIsTrue = true;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'is Empty'.tr;
                        } else if (p0.length < 8) {
                          return 'password is short'.tr;
                        } else if (!passwordIsTrue) {
                          return 'The password is incorrect'.tr;
                        }
                        return null;
                      },
                      obscureText: controller.loginPasswordIsVisible,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.loginPasswordIsVisible =
                                !controller.loginPasswordIsVisible;
                            controller.update();
                          },
                          icon: controller.loginPasswordIsVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  TextButton(
                      onPressed: () {
                        loginBottomSheet();
                      },
                      child: Text('forgot your Password?'.tr,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 17)))
                ],
              ),
            ),
          ])),
    );
