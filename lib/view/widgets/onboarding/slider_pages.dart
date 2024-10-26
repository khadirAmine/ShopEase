import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/source/static/static.dart';

class SliderPages extends StatelessWidget {
  const SliderPages({super.key, required this.onboardingController});
  final OnboardingController onboardingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.9,
        height: Get.height * 0.65,
        child: PageView.builder(
          onPageChanged: (value) {
            onboardingController.initialPage = value;
            for (int i = 0; i < onboardingController.itemColor.length; i++) {
              if (i == value) {
                onboardingController.itemColor[value] = Colors.blue;
              } else {
                onboardingController.itemColor[i] = Colors.black12;
              }
            }
            onboardingController.update();
          },
          controller: onboardingController.pageController,
          itemCount: onbordingList.length,
          itemBuilder: (context, i) {
            return SizedBox(
              width: Get.width * 0.9,
              child: Column(
                children: [
                  Text(onbordingList[i].title.tr,
                      style: const TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w500)),
                  const Divider(color: Colors.transparent),
                  SizedBox(
                    width: Get.width * 6,
                    child: Image.asset(onbordingList[i].imageAsset,
                        fit: BoxFit.fill),
                  ),
                  const Spacer(),
                  Text(onbordingList[i].body.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17))
                ],
              ),
            );
          },
        ));
  }
}
