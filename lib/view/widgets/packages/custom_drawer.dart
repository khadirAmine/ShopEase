import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constants/enums.dart';
import '../../../core/constants/variables.dart';
import '../../../core/functions/change_language.dart';
import '../../screen/us_details.dart';
import '../shared/profile_image.dart';
import 'cutom_card.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        CustomCard(
          height: Get.height * 0.21,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          color: Colors.blue[300],
          child: Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.08, right: Get.width * 0.08),
            child: ListTile(
              leading: SmallProfileImage(imageSize: size * 0.09),
              trailing: Text(
                  (userData[0] ?? {'user_name': 'username'})['user_name'],
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
        ),
        Divider(height: Get.height * 0.06),
        CustomCard(
            width: double.infinity,
            height: Get.height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Disable Notifications'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) => Switch(
                          value: disableNovificatoin,
                          onChanged: (value) async {
                            disableNovificatoin = !disableNovificatoin;
                            await preferences.setBool(
                                'disableNovificatoin', disableNovificatoin);
                            if (value) {
                              // messaging.getToken();
                            } else {
                              // messaging.deleteToken();
                            }
                            controller.update();
                          },
                          activeTrackColor: Colors.blue[900],
                        ))
              ],
            )),
        const Divider(),
        CustomCard(
            width: double.infinity,
            height: Get.height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue.shade400,
            alignment: Alignment.centerLeft,
            child: PopupMenuButton(
              onSelected: (value) {
                localeValue = value.toString();
                changeLanguage(value);
              },
              color: Colors.blue.shade300,
              offset: const Offset(50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select A Language'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  const Icon(Icons.translate)
                ],
              ),
              itemBuilder: (context) => [
                CheckedPopupMenuItem(
                    value: const Locale('en'), child: Text('English'.tr)),
                CheckedPopupMenuItem(
                    value: const Locale('fr'), child: Text('French'.tr)),
                CheckedPopupMenuItem(
                    value: const Locale('ar'), child: Text('Arabic'.tr)),
              ],
            )),
        const Divider(),
        CustomCard(
            onTap: () async {
              await usDetailsDialog(UsDetails.aboutUs);
            },
            width: double.infinity,
            height: Get.height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About Us'.tr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                const Icon(Icons.help_outline_sharp),
              ],
            )),
        const Divider(),
        CustomCard(
            onTap: () async {
              await usDetailsDialog(UsDetails.contactUs);
            },
            width: double.infinity,
            height: Get.height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contact Us'.tr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                const Icon(Icons.phone_callback_outlined),
              ],
            )),
      ]),
    );
  }
}
