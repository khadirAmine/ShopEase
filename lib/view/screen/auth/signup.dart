import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../widgets/auth/image_logo.dart';
import '../../widgets/auth/signup/buttons.dart';
import '../../widgets/auth/signup/input_text.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign Up'.tr,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        const ImageLogo(),
        inputTextSignupPage(controller.formState, controller),
        Divider(
          color: Colors.transparent,
          height: Get.height * 0.03,
        ),
        SignUpButtons(
          controller: controller,
        ),
        Divider(height: Get.height * 0.02, color: Colors.transparent),
        TextButton(
            onPressed: () {
              Get.offAllNamed('login');
            },
            child: Text('Login  ->'.tr,
                style: const TextStyle(color: Colors.blue, fontSize: 17)))
      ]),
    );
  }
}
