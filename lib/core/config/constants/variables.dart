// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/home/favorite_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../view/screen/home/favorite_body.dart';
import '../../../view/screen/home/home_body.dart';
import '../../../view/screen/home/cart_body.dart';
import '../../../view/screen/home/profile_body.dart';
import 'enums.dart';

late SharedPreferences preferences;

final ImagePicker picker = ImagePicker();

bool isOnboading = false;

String? localeValue;
final double size = ((Get.width) + (Get.height)) / 2;

bool emailIsExists = false;

bool passwordIsTrue = true;

RxBool internetStatus = RxBool(true);

PageController verifyBodyPageController = PageController();

List userData = [];

List categoriesData = [];

String userEmail = '';

List itemData = [];

List favoriteData = [];

List favoriteItemData = [];

List orderData = [];

bool homePageError = false;

bool favoritePageError = false;

bool categoriesOffstage = false;

RxBool homeBodyLoading = RxBool(false);

RxBool favoriteBodyLoading = RxBool(false);

List<Widget> homePages = [
  const HomeBody(),
  const FavoritePage(),
  const OrderBody(),
  const ProfileBody(),
];

List favoriteItemId = [];

HomeBodyStatus homeBodyStatus = HomeBodyStatus.home;

AppStatus appStatus = AppStatus.normal;

int favoriteIndex = 0;

late FavoriteController favoriteController;

HomeController homeController = Get.put(HomeController());

// late FirebaseMessaging messaging;

bool disableNovificatoin = true;

const String aboutUsText =
    'This is an experimental application for e-commerce and was developed by a flutter developer. This is one of the models. We can also develop more applications like this model. You can also request your own application under certain conditions. You can contact us through this information.';
