import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({super.key, required this.onboardingController});
  final OnboardingController onboardingController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) => SizedBox(
            width: 100,
            height: 10,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.itemColor.length,
              itemBuilder: (context, i) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: controller.itemColor[i],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2000))));
              },
            )));
  }
}
