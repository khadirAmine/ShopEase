// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/config/constants/routes.dart';
import '../../core/config/constants/variables.dart';
import '../../core/functions/exite_app.dart';
import '../widgets/onboarding/slider_dots.dart';
import '../widgets/onboarding/slider_pages.dart';
import '../widgets/packages/custom_button.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final OnboardingController onboardingController =
      Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            exiteApp();
          },
          child: Center(
            child: Column(
              children: [
                Divider(
                  color: Colors.transparent,
                  height: Get.height * 0.09,
                ),
                SliderPages(onboardingController: onboardingController),
                const Divider(color: Colors.transparent),
                SliderDots(onboardingController: onboardingController),
                Divider(
                  color: Colors.transparent,
                  height: Get.height * 0.04,
                ),
                CustomButton(
                  withe: Get.width * 0.35,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    if (onboardingController.initialPage == 3) {
                      preferences.setBool('isOnboarding', true);
                      Get.offNamed(Routes.home);
                    } else {
                      onboardingController.pageController.animateToPage(
                          onboardingController.initialPage += 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text('Continue'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17)),
                ),
                Divider(
                  color: Colors.transparent,
                  height: Get.height * 0.015,
                ),
                TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.home);
                      preferences.setBool('isOnboarding', true);
                    },
                    child: Text(
                      'Skip -->'.tr,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          )),
    );
  }
}
