// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/home/home_controller.dart';
import '../../data/remote/api_remote.dart';
import '../config/app_config.dart';
import '../config/constants/variables.dart';

class ServicesSetting extends GetxService {
  Future<ServicesSetting> init() async {
    preferences = await SharedPreferences.getInstance();
    await AppConfig.init();
    disableNovificatoin = preferences.getBool('disableNovificatoin') ?? true;
    if (disableNovificatoin) {
      // messaging.getToken().then((value) {});
    }
    isOnboading = preferences.getBool('isOnboarding') ?? false;
    localeValue = preferences.getString('localeValue');
    userEmail = preferences.getString('userEmail') ?? '';
    homeController = Get.put(HomeController());
    try {
      userData = await ApiRemote.selectUserData(userEmail);
    } catch (e) {
      null;
    }

    return this;
  }
}
