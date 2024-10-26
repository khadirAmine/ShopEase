import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/home/favorite_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constants/enums.dart';
import '../../../core/constants/variables.dart';

import '../../../core/functions/exite_app.dart';
import '../../widgets/home/appbar.dart';
import '../../widgets/packages/custom_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState>? scaffoldState = GlobalKey();
  final HomeController _controller = Get.put(HomeController());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          exiteApp();
        },
        child: Scaffold(
          key: scaffoldState,
          appBar: homeAppBar(scaffoldState, _controller),
          drawer: const CustomDrawer(),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 0,
            controller: tabController,
            items: [
              TabItem(icon: Icons.home, title: 'Home'.tr),
              TabItem(icon: Icons.favorite, title: 'Favorite'.tr),
              TabItem(icon: Icons.shopping_cart, title: 'Cart'.tr),
              TabItem(icon: Icons.people, title: 'Profile'.tr),
            ],
            height: Get.height * 0.06,
            backgroundColor: Colors.blue[400],
            onTap: (int i) async {
              try {
                _controller.searchTextController.clear();
                _controller.pageController.animateToPage(i,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
                _controller.homeBodyIs(i, _controller);
                setState(() {});
                if (i == 1) {
                  favoriteController = Get.put(FavoriteController());
                  if (favoriteItemData.isEmpty) {
                    await favoriteController.selectFavoriteItemData();
                  }
                  favoriteController.update();
                }
                if (itemData.isEmpty &&
                    i == 0 &&
                    appStatus == AppStatus.normal) {
                  await _controller.selectCategorie(0);
                }
                if (i == 2 || orderData.isEmpty) {
                  await _controller.getOrderData();
                }
              } catch (e) {
                null;
              }
            },
          ),
          body: PageView.builder(
            itemBuilder: (context, index) {
              return homePages[index];
            },
            controller: _controller.pageController,
            itemCount: homePages.length,
            onPageChanged: (value) async {
              try {
                _controller.homeBodyIs(value, _controller);
                if (value == 1) {
                  favoriteController = Get.put(FavoriteController());
                  if (favoriteItemData.isEmpty) {
                    await favoriteController.selectFavoriteItemData();
                  }
                  favoriteController.update();
                }
                if (itemData.isEmpty &&
                    value == 0 &&
                    appStatus == AppStatus.normal) {
                  await _controller.selectCategorie(0);
                }
                if (value == 2 && orderData.isEmpty) {
                  await _controller.getOrderData();
                }
                tabController.animateTo(value);
              } catch (e) {
                null;
              }
            },
          ),
        ));
  }
}
