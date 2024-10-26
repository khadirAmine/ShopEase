import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';
import '../constants/variables.dart';

class HaveLogin extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (isLogin) {
      return const RouteSettings(name: Routes.home);
    }
    return super.redirect(route);
  }
}
