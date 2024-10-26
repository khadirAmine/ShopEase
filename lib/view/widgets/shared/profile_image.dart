import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/constants/api_links.dart';
import '../../../core/config/constants/assets.dart';
import '../../../core/config/constants/enums.dart';
import '../../../core/config/constants/variables.dart';
import '../../../core/functions/insert_user_profile_image.dart';
import '../../../data/remote/api_remote.dart';
import '../packages/custom_button.dart';
import '../packages/loading.dart';

class SmallProfileImage extends StatelessWidget {
  const SmallProfileImage({super.key, this.onTap, this.imageSize});
  final void Function()? onTap;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: imageSize ?? size * 0.065,
          height: imageSize ?? size * 0.065,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(2000)),
              border: Border.all(color: Colors.black)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20000),
              child: smallImageChild())),
    );
  }
}

Widget smallImageChild() {
  try {
    if (userData[0]['user_image'].isEmpty) {
      return Image.asset(ImagesAsset.profileImage);
    } else {
      return FadeInImage.assetNetwork(
        placeholder: ImagesAsset.profileImage,
        image: "$usersImagesRoot/${userData[0]['user_image']}",
      );
    }
  } catch (e) {
    return Image.asset(ImagesAsset.profileImage);
  }
}

class BigProfileImage extends StatelessWidget {
  const BigProfileImage({super.key, required this.controller});

  // ignore: prefer_typing_uninitialized_variables
  final controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
              alignment: Alignment.center,
              width: size * 0.23,
              height: size * 0.23,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20000),
                  child: userData[0]['user_image'].isEmpty
                      ? Image.asset(ImagesAsset.profileImage)
                      : FadeInImage.assetNetwork(
                          placeholder: ImagesAsset.profileImage,
                          image:
                              "$usersImagesRoot/${userData[0]['user_image']}",
                          width: size * 0.23,
                          height: size * 0.23,
                          fit: BoxFit.fill,
                        ))),
        ),
        Positioned(
            top: Get.height * 0.14,
            left: Get.width * 0.13,
            child: CustomButton(
                onTap: () {
                  Get.bottomSheet(
                      backgroundColor: Colors.blue[300],
                      SizedBox(
                        height: Get.height * 0.11,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                onTap: () async {
                                  String imageName = await addUserProfileImage(
                                      userData[0]['user_id'],
                                      userData[0]['user_email'],
                                      imageSource: ImageSouress.camera);
                                  userData[0]['user_image'] = imageName;
                                  controller.update();
                                  Get.back();
                                },
                                height: Get.height * 0.07,
                                withe: Get.width * 0.2,
                                child: Icon(
                                  Icons.camera,
                                  size: size * 0.07,
                                ),
                              ),
                              CustomButton(
                                onTap: () async {
                                  String imageName = await addUserProfileImage(
                                      userData[0]['user_id'],
                                      userData[0]['user_email'],
                                      imageSource: ImageSouress.gallery);
                                  userData[0]['user_image'] = imageName;
                                  controller.update();
                                  Get.back();
                                },
                                height: Get.height * 0.07,
                                withe: Get.width * 0.2,
                                child: Icon(
                                  Icons.collections,
                                  size: size * 0.07,
                                ),
                              ),
                              if (userData[0]['user_image'].isNotEmpty)
                                CustomButton(
                                  onTap: () async {
                                    await deleteDialog(controller);
                                  },
                                  height: Get.height * 0.07,
                                  withe: Get.width * 0.2,
                                  child: Icon(
                                    Icons.delete,
                                    size: size * 0.07,
                                  ),
                                ),
                            ]),
                      ));
                },
                withe: Get.width * 0.11,
                height: Get.height * 0.035,
                color: Colors.blue[300],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [],
                child: const Icon(Icons.add))),
      ],
    );
  }
}

Future deleteDialog(var controller) => Get.defaultDialog(
    // content: ,
    title: 'Delete Profile Image'.tr,
    content: Text('Are Your sure to delete your profile image?'.tr,
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
    cancel: CustomButton(
      onTap: () async {
        controller.deleteProfileImageLoading.value = true;
        controller.update();
        await ApiRemote.deleteUserPrfileImage(
            userData[0]['user_image'], userData[0]['user_id']);
        userData[0]['user_image'] = '';
        controller.deleteProfileImageLoading.value = true;
        controller.update();
        Get.back();
        Get.back();
      },
      color: Colors.orange,
      child: Loading(
          size: 20,
          color: Colors.white,
          isLoading: controller.deleteProfileImageLoading,
          child: Text('Delete'.tr,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
    ),
    confirm: CustomButton(
        onTap: () {
          Get.back();
          Get.back();
        },
        child: Text('Cancel'.tr,
            style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))));
