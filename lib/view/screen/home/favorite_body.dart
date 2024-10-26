import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/favorite_controller.dart';
import '../../../core/config/constants/routes.dart';
import '../../../core/config/constants/variables.dart';
import '../../../core/functions/delet_favorite.dart';
import '../../../data/model/items_model.dart';
import '../../widgets/home/item_card.dart';
import '../../widgets/packages/loading.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller) => RefreshIndicator(
              color: Colors.blueAccent,
              child: favoritePageError
                  ? IconButton(
                      onPressed: () async {
                        await controller.selectFavoriteItemData();
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.blue,
                      iconSize: size * 0.07,
                    )
                  : Loading(
                      isLoading: favoriteBodyLoading,
                      size: size * 0.055,
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Offstage(
                            offstage: categoriesOffstage,
                            child: Column(
                              children: [
                                const Divider(color: Colors.transparent),
                                Row(children: [
                                  VerticalDivider(
                                    color: Colors.transparent,
                                    width: Get.width * 0.15,
                                  ),
                                  Text('favorite'.tr,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600)),
                                ])
                              ],
                            )),
                        const Divider(color: Colors.transparent),
                        // items
                        Expanded(
                          child: SizedBox(
                            child: favoriteItemData.isNotEmpty
                                ? Scrollbar(
                                    interactive: true,
                                    radius: const Radius.circular(10),
                                    thickness: 7,
                                    notificationPredicate: (notification) {
                                      if (controller.scrollController.position
                                              .pixels >
                                          10) {
                                        categoriesOffstage = true;
                                      } else {
                                        categoriesOffstage = false;
                                      }
                                      controller.update();
                                      return true;
                                    },
                                    controller: controller.scrollController,
                                    child: GridView.builder(
                                      controller: controller.scrollController,
                                      itemCount: favoriteItemData.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.8),
                                      itemBuilder: (context, i) {
                                        return ItemCard(
                                            cardPressed: () async {
                                              Get.toNamed(Routes.itemDetails,
                                                  arguments: {
                                                    'itemData':
                                                        favoriteItemData[i],
                                                    'itemIndex': i,
                                                    'fromHome': false
                                                  });
                                            },
                                            favoritePressed: () async {
                                              await deletFavorite(
                                                  userData[0]['user_id'],
                                                  favoriteItemData[i]
                                                      ['item_id'],
                                                  i,
                                                  controller);
                                            },
                                            itemModel: ItemsModel.fromJson(
                                                favoriteItemData[i]));
                                      },
                                    ))
                                : Center(
                                    child:
                                        Text('you don\'t have any favorite'.tr),
                                  ),
                          ),
                        )
                      ])),
              onRefresh: () async {
                await controller.selectFavoriteItemData();
              })),
    );
  }
}
