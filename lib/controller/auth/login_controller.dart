import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/constants/api_links.dart';
import '../../core/constants/routes.dart';
import '../../core/constants/variables.dart';
import '../../data/remote/api_remote.dart';
import '../../view/widgets/auth/change_password.dart';

class LoginController extends GetxController {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  Crud crud = Crud();
  bool loginPasswordIsVisible = true;
  RxBool loginLoading = RxBool(false);

  //* Login
  Future loginFuncton() async {
    try {
      loginLoading.value = true;
      if (formState.currentState!.validate()) {
        // check if email is exists
        if (await ApiRemote.checkEmailExists(textEditingControllerEmail.text)) {
          emailIsExists = true;
          formState.currentState!.validate();
          // if password is true
          if (await checkPassword(textEditingControllerEmail.text,
              textEditingControllerPassword.text)) {
            // if email is virified
            if (await ApiRemote.checkEmailValidation(
                textEditingControllerEmail.text)) {
              await preferences.setBool('isLogin', true);
              await preferences.setString(
                  'userEmail', textEditingControllerEmail.text);
              userData = await ApiRemote.selectUserData(userEmail);
              Get.offAllNamed(Routes.home);
            }
            // if email is not virified send Code Virification And Go To Virificatoin page
            else {
              int codeVirifiy = await ApiRemote.selectVirificationCodeFunctoin(
                  textEditingControllerEmail.text);
              await ApiRemote.sendEmail(
                  textEditingControllerEmail.text,
                  'Virification',
                  "Enter the Code for Virifiy your Email: $codeVirifiy");
              await preferences.setString(
                  'userEmail', textEditingControllerEmail.text);
              userData = await ApiRemote.selectUserData(userEmail);
              Get.toNamed(Routes.verifyemail,
                  arguments: {'email': textEditingControllerEmail.text});
            }
          }
          // if password is false
          else {
            passwordIsTrue = false;
            formState.currentState!.validate();
          }
          // if email is not exits
        } else {
          emailIsExists = false;
          formState.currentState!.validate();
        }
      }
      loginLoading.value = false;
    } catch (e) {
      loginLoading.value = false;
    }
  }

  Future<bool> checkPassword(String email, String password) async {
    var request = await crud.postData(selectPasswordLink, {'email': email});
    Uint8List bytes = utf8.encode(password); // Convert input to bytes
    Digest digest = sha1.convert(bytes); // Compute SHA-1 hash
    if (digest.toString() == jsonDecode(request)[0]['user_password']) {
      return true;
    } else {
      return false;
    }
  }
}

class ButtomSheetController extends GetxController {
  TextEditingController textEditingControllerEmail = TextEditingController();

  final GlobalKey<FormState> formStateEmail = GlobalKey();

  FocusNode focusNodeEmail = FocusNode();

  bool textVisible = false;

  bool sendCodeVisible = true;

  bool emailIsExist = true;

  RxBool sendCodeLoading = RxBool(false);

  bool hasError = false;

  bool checkCodeVisibleLoading = false;

  //* check if email is exist and send code virification
  Future sendCodeFuncton() async {
// check email is valid
    if (formStateEmail.currentState!.validate()) {
      sendCodeLoading.value = true;
      // check Email is exists
      if (await ApiRemote.checkEmailExists(textEditingControllerEmail.text)) {
        int codeVirifiy = await ApiRemote.selectVirificationCodeFunctoin(
            textEditingControllerEmail.text);
        await ApiRemote.sendEmail(
            textEditingControllerEmail.text,
            'Virification',
            "Enter the Code for Virifiy your Email: $codeVirifiy");
        textVisible = true;
        sendCodeLoading.value = false;
        sendCodeVisible = false;
        update();
        await Future.delayed(const Duration(seconds: 15));
        sendCodeVisible = true;
        update();
      }
      // if email is not exist
      else {
        emailIsExist = false;
        sendCodeVisible = true;
        sendCodeLoading.value = false;
        update();
        formStateEmail.currentState!.validate();
      }
    }
  }

  //* check code Virification
  Future checkCodeVirificatoin(int inputeCode) async {
    if (formStateEmail.currentState!.validate()) {
      checkCodeVisibleLoading = true;
      update();
      // select code virificaton
      int codeVirifiy = await ApiRemote.selectVirificationCodeFunctoin(
          textEditingControllerEmail.text);
      // if inputeCode is correct show dialog for change password
      if (inputeCode == codeVirifiy) {
        hasError = false;
        update();
        await crud.postData(
            changeCodeVirification, {'email': textEditingControllerEmail.text});
        changePasswordDialoge(textEditingControllerEmail.text);
      } else {
        hasError = true;
      }
      checkCodeVisibleLoading = false;
      update();
    }
  }
}
