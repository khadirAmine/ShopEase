import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';
import '../../controller/itemdetails_controller.dart';
import '../../core/config/constants/variables.dart';
import '../../core/functions/add_favorite_data.dart';
import '../../core/functions/delet_favorite.dart';
import '../../data/remote/api_remote.dart';
import '../widgets/itemDetails/bottombody.dart';
import '../widgets/itemDetails/details_scaffold.dart';
import '../widgets/itemDetails/item_image_details.dart';
import '../widgets/itemDetails/item_name.dart';
import '../widgets/shared/profile_image.dart';

class Itemdetails extends StatelessWidget {
  const Itemdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        orderData = await ApiRemote.selectOrderData(userData[0]['user_id']);
        homeController.update();
      },
      child: DetailsScaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              elevation: 0,
              actions: [
                GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) => SmallProfileImage(onTap: () {
                          Get.back();
                          controller.pageController.animateToPage(3,
                              duration: const Duration(seconds: 1),
                              curve: Curves.decelerate);
                          controller.homeBodyIs(3, controller);
                          controller.update();
                        })),
                const VerticalDivider(color: Colors.transparent),
              ]),
          body: GetBuilder<ItemDetailsController>(
              init: ItemDetailsController(),
              builder: (controller) => Container(
                  color: Colors.transparent,
                  child: Column(children: [
                    ItemName(controller: controller),
                    Divider(
                        color: Colors.transparent, height: Get.height * 0.06),
                    ItemImageDetails(
                      imageName: controller.imageName,
                      itemDiscount: double.parse(controller.itemDiscount),
                      itemId: controller.itemId,
                      onPressedFavorite: () async {
                        if (favoriteItemId.contains(controller.itemId)) {
                          await deletFavorite(
                              userData[0]['user_id'],
                              controller.itemId,
                              controller.itemIndex,
                              controller,
                              home: controller.fromHome);
                        } else {
                          await addFavoriteData(
                              userData[0]['user_id'],
                              controller.itemId,
                              controller.itemData,
                              controller);
                        }
                        controller.update();
                      },
                    ),
                    Divider(
                        color: Colors.transparent, height: Get.height * 0.03),
                    BottomBody(controller: controller)
                  ])))),
    );
  }
}
