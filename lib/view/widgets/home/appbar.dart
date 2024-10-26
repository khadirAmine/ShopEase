import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/config/constants/enums.dart';
import '../../../core/config/constants/variables.dart';
import '../packages/custom_textformfield.dart';
import '../shared/profile_image.dart';

AppBar homeAppBar(
    GlobalKey<ScaffoldState>? scaffoldState, HomeController controller) {
  FocusNode focusNode = FocusNode();
  return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: Get.height * 0.1,
      elevation: 0,
      shadowColor: Colors.blue.shade200,
      leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.black,
          iconSize: size * 0.05,
          onPressed: () {
            scaffoldState!.currentState!.openDrawer();
          }),
      actions: [
        GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) =>
                (homeBodyStatus != HomeBodyStatus.profile &&
                        homeBodyStatus != HomeBodyStatus.order)
                    ? Row(children: [
                        CustomTextFormField(
                          controller: controller.searchTextController,
                          onChanged: (value) async {
                            await controller.searchItem(value);
                          },
                          onTapOutside: (p0) {
                            focusNode.unfocus();
                          },
                          focusNode: focusNode,
                          maxWidth: Get.width * 0.6,
                          suffixIcon: Icon(Icons.search,
                              size: size * 0.045, color: Colors.blue[300]),
                          labelText: 'Search'.tr,
                        ),
                        const VerticalDivider(color: Colors.transparent),
                      ])
                    : const Text('')),
        SmallProfileImage(onTap: () {
          controller.pageController.animateToPage(3,
              duration: const Duration(seconds: 1), curve: Curves.decelerate);
          controller.homeBodyIs(3, controller);
          controller.update();
        }),
        const VerticalDivider(color: Colors.transparent),
      ]);
}
