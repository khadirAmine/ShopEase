import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/config/constants/routes.dart';
import '../../../core/config/constants/variables.dart';
import '../../../core/functions/add_favorite_data.dart';
import '../../../core/functions/delet_favorite.dart';
import '../../../data/model/categories_moderl.dart';
import '../../../data/model/items_model.dart';
import '../../widgets/home/categoriescard.dart';
import '../../widgets/home/item_card.dart';
import '../../widgets/packages/loading.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => RefreshIndicator(
              color: Colors.blueAccent,
              child: homePageError
                  ? IconButton(
                      onPressed: () async {
                        await controller.homeInit();
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.blue,
                      iconSize: size * 0.07,
                    )
                  : Loading(
                      isLoading: homeBodyLoading,
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
                                  Text('Categories'.tr,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600)),
                                ])
                              ],
                            )),
                        const Divider(color: Colors.transparent),
                        // Categories
                        SizedBox(
                            height: Get.height * 0.055,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesData.length,
                                itemBuilder: (context, i) {
                                  return CategoriesCard(
                                      onTap: () async {
                                        controller.searchTextController.clear();
                                        await controller.selectCategorie(i,
                                            categorieId: categoriesData[i]
                                                ['categorie_name']);
                                      },
                                      color: controller.categoriesColor[i],
                                      categoriesModel: CategoriesModel.fromJson(
                                          categoriesData[i]));
                                })),
                        const Divider(color: Colors.transparent),
                        // items
                        Expanded(
                          child: SizedBox(
                            child: itemData.isNotEmpty
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
                                      itemCount: itemData.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.8),
                                      itemBuilder: (context, i) {
                                        return ItemCard(
                                            cardPressed: () {
                                              Get.toNamed(Routes.itemDetails,
                                                  arguments: {
                                                    'itemData': itemData[i],
                                                    'itemIndex': i,
                                                    'fromHome': true
                                                  });
                                            },
                                            favoritePressed: () async {
                                              if (favoriteItemId.contains(
                                                  itemData[i]['item_id'])) {
                                                await deletFavorite(
                                                    userData[0]['user_id'],
                                                    itemData[i]['item_id'],
                                                    favoriteIndex,
                                                    controller,
                                                    home: true);
                                              } else {
                                                await addFavoriteData(
                                                    userData[0]['user_id'],
                                                    itemData[i]['item_id'],
                                                    itemData[i],
                                                    controller);
                                              }
                                              controller.update();
                                            },
                                            itemModel: ItemsModel.fromJson(
                                                itemData[i]));
                                      },
                                    ))
                                : Center(child: Text('No results'.tr)),
                          ),
                        )
                      ])),
              onRefresh: () async {
                await controller.homeInit();
              })),
    );
  }
}
