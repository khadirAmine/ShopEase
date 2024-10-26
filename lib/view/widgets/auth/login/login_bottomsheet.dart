import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../packages/custom_otptextfield.dart';
import '../../packages/custom_textformfield.dart';
import '../../packages/loading.dart';

Future loginBottomSheet() =>
    Get.bottomSheet(const Body(), backgroundColor: Colors.white);

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GetBuilder<ButtomSheetController>(
            init: ButtomSheetController(),
            builder: (controller) => ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const Divider(color: Colors.transparent),
                      Visibility(
                          visible: controller.textVisible,
                          child: Column(
                            children: [
                              Text('Verify Your email'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500)),
                              const Divider(color: Colors.transparent),
                              Text('Please enter 4 digit code send to :'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400))
                            ],
                          )),
                      Divider(
                          height: Get.height * 0.04, color: Colors.transparent),
                      Form(
                        key: controller.formStateEmail,
                        child: CustomTextFormField(
                          suffixIcon: const Icon(Icons.email),
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          controller: controller.textEditingControllerEmail,
                          labelText: 'email'.tr,
                          focusNode: controller.focusNodeEmail,
                          onTapOutside: (p0) {
                            controller.focusNodeEmail.unfocus();
                          },
                          onChanged: (value) {
                            controller.emailIsExist = true;
                          },
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'is Empty'.tr;
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(p0)) {
                              return "Invalid Email".tr;
                            }
                            if (!controller.emailIsExist) {
                              return 'email is not Exists'.tr;
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const Divider(color: Colors.transparent),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.09),
                          child: Visibility(
                              visible: controller.sendCodeVisible,
                              child: InkWell(
                                onTap: () async {
                                  try {
                                    await controller.sendCodeFuncton();
                                  } catch (e) {
                                    null;
                                  }
                                },
                                child: Loading(
                                    isLoading: controller.sendCodeLoading,
                                    size: 16,
                                    color: Colors.blue,
                                    child: Text('send Code'.tr,
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500))),
                              ))),
                      const Divider(color: Colors.transparent),
                      Container(
                          color: Colors.white,
                          width: Get.width * 0.5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const VerticalDivider(),
                                CustomOTPTextField(
                                  onCompleted: (value) async {
                                    try {
                                      await controller.checkCodeVirificatoin(
                                          int.parse(value));
                                    } catch (e) {
                                      null;
                                    }
                                  },
                                  hasError: controller.hasError,
                                  onChanged: (value) {},
                                ),
                                Visibility(
                                    visible: controller.checkCodeVisibleLoading,
                                    child: LoadingAnimationWidget.inkDrop(
                                      color: Colors.indigoAccent,
                                      size: 25,
                                    ))
                              ])),
                    ])));
  }
}
