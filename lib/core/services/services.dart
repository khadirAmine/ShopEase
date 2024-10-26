// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/home/home_controller.dart';
import '../../data/remote/api_remote.dart';
import '../constants/variables.dart';

class ServicesSetting extends GetxService {
  Future<ServicesSetting> init() async {
    preferences = await SharedPreferences.getInstance();
    // messaging = FirebaseMessaging.instance;
    disableNovificatoin = preferences.getBool('disableNovificatoin') ?? true;
    if (disableNovificatoin) {
      // messaging.getToken().then((value) {});
    }
    isOnboading = preferences.getBool('isOnboarding') ?? false;
    localeValue = preferences.getString('localeValue');
    isLogin = preferences.getBool('isLogin') ?? false;
    userEmail = preferences.getString('userEmail') ?? '';
    if (isLogin) {
      homeController = Get.put(HomeController());
      try {
        userData = await ApiRemote.selectUserData(userEmail);
      } catch (e) {
        null;
      }
    }
    return this;
  }
}
