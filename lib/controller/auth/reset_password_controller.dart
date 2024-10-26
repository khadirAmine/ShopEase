import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/constants/api_links.dart';

class ResetPasswordController extends GetxController {
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerRePassword =
      TextEditingController();

  Crud crud = Crud();

  GlobalKey<FormState> formStatekey = GlobalKey();

  bool passwordIsVisible = true;

  RxBool changeLoading = RxBool(false);

  //* change Password
  Future changePassword(String email) async {
    if (formStatekey.currentState!.validate()) {
      changeLoading.value = true;
      update();
      await crud.postData(changePasswordLink,
          {'email': email, 'password': textEditingControllerRePassword.text});
      Get.back();
      Get.back();
    }
  }
}
