import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../controller/auth/verify_email_controller.dart';
import '../../../../core/constants/assets.dart';
import '../../packages/custom_otptextfield.dart';
import '../../packages/loading.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const NeverScrollableScrollPhysics(), children: [
      SizedBox(
        width: Get.width,
        height: Get.height,
        child: PageView(children: [
          Column(
            children: [
              SizedBox(
                height: Get.height * 0.35,
                child: GetBuilder<VerifyEmailController>(
                    init: VerifyEmailController(),
                    builder: (controller) => PageView(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Image.asset(
                                ImagesAsset.checkEmail,
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                ImagesAsset.emailSuccess,
                              ),
                            )
                          ],
                        )),
              ),
              Text('Verify Your email'.tr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
              const Divider(color: Colors.transparent),
              Text('Please enter 4 digit code send to :'.tr,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500)),
              GetBuilder<VerifyEmailController>(
                  init: VerifyEmailController(),
                  builder: (controller) => Column(
                        children: [
                          Text(controller.email,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orangeAccent)),
                          Divider(
                              color: Colors.transparent,
                              height: Get.height * 0.04),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const VerticalDivider(),
                                CustomOTPTextField(
                                  onCompleted: (value) async {
                                    await controller.checkVirificationCode(
                                        int.parse(value));
                                  },
                                  hasError: controller.hasError,
                                  onChanged: (value) {},
                                ),
                                Visibility(
                                    visible: controller.loadingCodeVisibility,
                                    child: LoadingAnimationWidget.inkDrop(
                                      color: Colors.indigoAccent,
                                      size: 25,
                                    ))
                              ]),
                          Divider(
                              color: Colors.transparent,
                              height: Get.height * 0.03),
                          Visibility(
                            visible: controller.resendVisibility,
                            child: Loading(
                              isLoading: controller.resendIsLoading,
                              color: Colors.deepOrangeAccent,
                              size: 17,
                              onTap: () async {
                                controller.resendIsLoading.value = true;
                                await controller.resedCode();
                                controller.resendIsLoading.value = false;
                              },
                              child: Text('Resend'.tr,
                                  style: const TextStyle(
                                      color: Colors.deepOrangeAccent)),
                            ),
                          )
                        ],
                      ))
            ],
          ),
        ]),
      ),
    ]);
  }
}
