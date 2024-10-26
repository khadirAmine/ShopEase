// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';
import '../constants/variables.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (isOnboading) {
      return const RouteSettings(name: Routes.home);
    }
    return super.redirect(route);
  }
}
