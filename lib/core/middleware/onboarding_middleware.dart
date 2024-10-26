// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../config/constants/routes.dart';
import '../config/constants/variables.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (isOnboading) {
      return const RouteSettings(name: Routes.home);
    }
    return super.redirect(route);
  }
}
