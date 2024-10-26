import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/constants/api_links.dart';
import '../../core/constants/routes.dart';
import '../../core/constants/variables.dart';
import '../../data/remote/api_remote.dart';

class SignupController extends GetxController {
  TextEditingController textEditingControllerUsername = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  bool passwordIsVisible = true;
  RxBool signUpLoading = RxBool(false);
  RxBool signUpWithGoogleLoading = RxBool(false);
  Crud crud = Crud();

  // Insert Data
  Future insertData(String username, String email, String password) async {
    var request = await crud.postData(signUpLink, {
      'username': username,
      'email': email,
      'password': password,
    });
    return request;
  }

  // Sign Up
  Future signUp() async {
    signUpLoading.value = true;
    if (formState.currentState!.validate()) {
      // check fi email is exists
      if (await ApiRemote.checkEmailExists(textEditingControllerEmail.text) ??
          false) {
        emailIsExists = true;
        formState.currentState!.validate();
      }
      // sign up
      else {
        await insertData(
            textEditingControllerUsername.text,
            textEditingControllerEmail.text,
            textEditingControllerPassword.text);
        int codeVirifiy = await ApiRemote.selectVirificationCodeFunctoin(
            textEditingControllerEmail.text);
        await ApiRemote.sendEmail(
            textEditingControllerEmail.text,
            'Virification',
            "Enter the Code for Virifiy your Email: $codeVirifiy");
        Get.toNamed(Routes.verifyemail,
            arguments: {'email': textEditingControllerEmail.text});
      }
    }
    signUpLoading.value = false;
  }
}
