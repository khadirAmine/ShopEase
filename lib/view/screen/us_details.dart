import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';
import '../../core/config/constants/enums.dart';
import '../../core/config/constants/variables.dart';
import '../../data/remote/api_remote.dart';
import '../../data/source/static/static.dart';
import '../widgets/contact_us/contact_button.dart';
import '../widgets/packages/custom_button.dart';
import '../widgets/packages/custom_textformfield.dart';
import '../widgets/packages/loading.dart';

Future usDetailsDialog(UsDetails usdetails) => Get.dialog(
      UsDetailsBody(usdetails: usdetails),
    );

class UsDetailsBody extends StatelessWidget {
  const UsDetailsBody({super.key, required this.usdetails});

  final UsDetails usdetails;
  @override
  Widget build(BuildContext context) {
    return usdetails == UsDetails.aboutUs
        ? Dialog(
            insetPadding: const EdgeInsets.all(15),
            backgroundColor: const Color(0xFFddf1fa),
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.9,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) => ListView(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.commentTextController.clear();
                                  },
                                  icon: Icon(Icons.close, size: size * 0.06)),
                              Text(aboutUsText.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              const Divider(),
                              if (controller
                                  .commentTextController.text.isNotEmpty)
                                CustomButton(
                                    onTap: () async {
                                      controller.sendLoading.value = true;
                                      int i = int.parse(
                                          await ApiRemote.insertComment(
                                              userData[0]['user_id'],
                                              controller
                                                  .commentTextController.text));
                                      controller.sendLoading.value = false;
                                      if (i > 0) {
                                        Get.dialog(Icon(Icons.check_circle,
                                            color: Colors.greenAccent,
                                            size: size * 0.13));
                                      }
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      Get.back();
                                    },
                                    withe: Get.width * 0.25,
                                    child: Loading(
                                      isLoading: controller.sendLoading,
                                      size: size * 0.035,
                                      child: const Icon(Icons.send,
                                          color: Colors.white),
                                    )),
                              const Divider(color: Colors.transparent),
                              Container(
                                color: Colors.black12,
                                width: Get.width,
                                height: Get.height * 0.4,
                                child: CustomTextFormField(
                                  controller: controller.commentTextController,
                                  onChanged: (value) {
                                    if (value.isEmpty || value.isNotEmpty) {
                                      controller.update();
                                    }
                                  },
                                  hinitText: 'Comment',
                                  fillColor: Colors.transparent,
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                  maxLines: 300,
                                  minWidth: 0,
                                  maxWidth: Get.width * 0.006,
                                  maxHeight: double.infinity,
                                ),
                              )
                            ],
                          ))),
            ),
          )
        : Dialog(
            backgroundColor: const Color(0xFFddf1fa),
            child: SizedBox(
                width: Get.width,
                height: Get.height * 0.58,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: List.generate(
                          contactItems.length,
                          (i) => ContactButton(
                              showLink: contactItems[i].showLink,
                              icon: contactItems[i].icon,
                              color: contactItems[i].color,
                              uri: contactItems[i].uri))),
                )));
  }
}
