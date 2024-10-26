import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/config/constants/variables.dart';
import 'core/localization/translation.dart';
import 'core/middleware/onboarding_middleware.dart';
import 'core/services/init_service.dart';
import 'view/screen/home/home.dart';
import 'view/screen/itemdetails.dart';
import 'view/screen/onboarding .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initeServices();
  runApp(const MyApp());
}

Future initeServices() async {
  await Get.putAsync(() => ServicesSetting().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      translations: MyTranslation(),
      locale: localeValue == null ? Get.deviceLocale : Locale(localeValue!),
      initialRoute: 'onboarding',
      getPages: [
        GetPage(name: '/home', page: () => const Home()),
        GetPage(
            name: '/itemdetails',
            page: () => const Itemdetails(),
            transition: Transition.upToDown),
        GetPage(
            name: '/onboarding',
            page: () => Onboarding(),
            middlewares: [OnboardingMiddleware()]),
      ],
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)))),
          scaffoldBackgroundColor: const Color(0xFFddf1fa)),
    );
  }
}
