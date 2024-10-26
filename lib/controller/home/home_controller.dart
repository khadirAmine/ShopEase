import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/constants/enums.dart';
import '../../core/config/constants/variables.dart';
import '../../core/functions/select_favorite_data.dart';
import '../../data/remote/api_remote.dart';
import 'favorite_controller.dart';

class HomeController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  PageController pageController = PageController();

  List<Color> categoriesColor = [];

  ScrollController scrollController = ScrollController();

  RxBool orderBodyLoading = RxBool(false);

  RxBool deleteLoading = RxBool(false);

  RxBool sendLoading = RxBool(false);

  TextEditingController commentTextController = TextEditingController();

//! select Categorie
  Future selectCategorie(int colorIndex,
      {String? categorieId, bool? initHome}) async {
    // change Catigorie Color
    changeColor() {
      if (categoriesColor[colorIndex] == Colors.transparent) {
        for (int i = 0; i < categoriesColor.length; i++) {
          if (i == colorIndex) {
            categoriesColor[i] = Colors.blue[200]!;
          } else {
            categoriesColor[i] = Colors.transparent;
          }
        }
        categoriesData[colorIndex]['categorie_name'] != 'All'
            ? categorieId =
                categoriesData[colorIndex]['categorie_id'].toString()
            : categorieId = 'all';
      } else {
        categoriesColor[colorIndex] = Colors.transparent;
        categoriesColor[0] = Colors.blue[200]!;
        categorieId = 'all';
      }
    }

// select item by categorie
    Future selectItem() async {
      itemData = await ApiRemote.selectItemCategorie(categorieId!);
    }

    !(initHome ?? false) ? homeBodyLoading.value = true : false;
    changeColor();
    try {
      if (categorieId == 'all') {
        itemData = await ApiRemote.selectItemData();
      } else {
        await selectItem();
      }
    } catch (e) {
      null;
    }
    !(initHome ?? false) ? homeBodyLoading.value = false : false;
  }

//! Search on item
  Future searchItem(String word) async {
    try {
      if (homeBodyStatus == HomeBodyStatus.home) {
        homeBodyLoading.value = true;
        itemData = await ApiRemote.searchItem(localeValue ?? 'en', word);
        homeBodyLoading.value = false;
        update();
      } else if (homeBodyStatus == HomeBodyStatus.favorite) {
        favoriteBodyLoading.value = true;
        favoriteItemData = await ApiRemote.searchFavorite(
            localeValue ?? 'en', word, userData[0]['user_id']);

        favoriteController.update();
        favoriteBodyLoading.value = false;
      }
    } catch (e) {
      favoriteBodyLoading.value = false;
      homeBodyLoading.value = false;
    }
  }

//! Init home
  Future homeInit() async {
    try {
      homePageError = false;
      homeBodyLoading.value = true;
      update();
      categoriesData = await ApiRemote.selectAllData('categories');
      for (int i = 0; i < categoriesData.length; i++) {
        categoriesColor.add(Colors.transparent);
      }
      await selectCategorie(0, initHome: true);
      userData = await ApiRemote.selectUserData(
          preferences.getString('userEmail') ?? '');
      await selectFavoriteData(userData[0]['user_id']);
      update();
      homeBodyLoading.value = false;
      favoriteController = Get.put(FavoriteController());
      await selectFavoriteItemData();
    } catch (e) {
      homeBodyLoading.value = false;
      homePageError = true;
    }
    update();
  }

  //! select Favorite Item Data
  Future selectFavoriteItemData() async {
    favoriteBodyLoading.value = true;
    try {
      favoritePageError = false;
      favoriteController.update();
      List request = [];
      for (int i = 0; i < favoriteItemId.length; i++) {
        request.addAll(await ApiRemote.selectFavoriteItem(favoriteItemId[i]));
      }
      favoriteItemData = request;
      favoriteController.update();
      favoriteBodyLoading.value = false;
      favoriteIndex = favoriteItemData.length;
      if (appStatus == AppStatus.internet) {
        favoritePageError = true;
        favoriteController.update();
      }
    } catch (e) {
      favoritePageError = true;
      favoriteController.update();
    }
  }

  //! home body status
  homeBodyIs(int i, HomeController controller) {
    if (i == 0) {
      homeBodyStatus = HomeBodyStatus.home;
    } else if (i == 1) {
      homeBodyStatus = HomeBodyStatus.favorite;
    } else if (i == 2) {
      homeBodyStatus = HomeBodyStatus.order;
    } else if (i == 3) {
      homeBodyStatus = HomeBodyStatus.profile;
    }
    update();
  }

//!  Select Order Data
  Future getOrderData() async {
    try {
      orderBodyLoading.value = true;
      orderData = await ApiRemote.selectOrderData(userData[0]['user_id']);
      update();
      orderBodyLoading.value = false;
    } catch (e) {
      orderBodyLoading.value = false;
    }
  }

  @override
  void onInit() async {
    await homeInit();
    super.onInit();
  }
}
