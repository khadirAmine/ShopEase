import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/exite_app.dart';
import '../../widgets/auth/image_logo.dart';
import '../../widgets/auth/login/buttons.dart';
import '../../widgets/auth/login/input_text.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Login'.tr,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              exiteApp();
            },
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const ImageLogo(),
                  GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) => inputTextLoginPage(
                            controller,
                          )),
                  Divider(
                    color: Colors.transparent,
                    height: Get.height * 0.03,
                  ),
                  LoginButtons(controller: controller),
                  Divider(height: Get.height * 0.03, color: Colors.transparent),
                  TextButton(
                      onPressed: () async {
                        Get.toNamed(Routes.signup);
                      },
                      child: Text('Sign Up  ->'.tr,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 17)))
                ])));
  }
}
