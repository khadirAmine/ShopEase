import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verify_email_controller.dart';
import '../../../core/constants/variables.dart';
import '../../widgets/auth/verifiy_email/add_user_image.dart';
import '../../widgets/auth/verifiy_email/verify_code_body.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyEmailController>(
        init: VerifyEmailController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: controller.automaticallyImplyLeading,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: PageView(
                  controller: verifyBodyPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [VerifyCodeBody(), AddUserImage()]),
            ));
  }
}
