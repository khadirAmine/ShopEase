import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/constants/api_links.dart';
import '../../core/constants/variables.dart';
import '../../data/remote/api_remote.dart';

class VerifyEmailController extends GetxController {
  RxBool checkIsLoading = RxBool(false);
  RxBool resendIsLoading = RxBool(false);
  RxBool deleteProfileImageLoading = RxBool(false);
  bool resendVisibility = false;
  bool loadingCodeVisibility = false;
  bool hasError = false;
  late String email;
  PageController pageController = PageController();
  bool automaticallyImplyLeading = true;

  Crud crud = Crud();

  @override
  void onInit() async {
    email = Get.arguments['email'];
    await preferences.setString('userEmail', email);
    userData = await ApiRemote.selectUserData(userEmail);
    await startResendVisibility();
    super.onInit();
  }

  //* for start resend visibility text for 15 seconds
  Future startResendVisibility() async {
    resendVisibility = false;
    update();
    await Future.delayed(const Duration(seconds: 15));
    resendVisibility = true;
    update();
  }

  //* check virification code if is correct Get.offAllNamed(home)
  Future checkVirificationCode(int codeVirifiy) async {
    try {
      loadingCodeVisibility = true;
      update();
      int selectedcodeVirifiy =
          await ApiRemote.selectVirificationCodeFunctoin(email);
      // check realy code
      if (codeVirifiy == selectedcodeVirifiy) {
        hasError = false;
        update();
        loadingCodeVisibility = false;
        update();
        // change image logo
        await pageController.animateToPage(1,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeOut);
        userData = await ApiRemote.selectUserData(email);
        await preferences.setString('userEmail', userData[0]['user_email']);
        await verifyBodyPageController.animateToPage(1,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        automaticallyImplyLeading = false;
        update();
        await changeCodeVirifiy(email);
        await preferences.setBool('isLogin', true);
      } else {
        hasError = true;
        update();
        loadingCodeVisibility = false;
        update();
      }
    } catch (e) {
      null;
    }
  }

  //* changeCodeVirifiy
  Future changeCodeVirifiy(String email) async {
    var resquest =
        await crud.postData(changeCodeVirifiyAndValideLink, {'email': email});
    return resquest;
  }

  //! Resend virificatoin code
  Future resedCode() async {
    int selectedcodeVirifiy =
        await ApiRemote.selectVirificationCodeFunctoin(email);
    await ApiRemote.sendEmail(email, 'Virification',
        "Enter the Code for Virifiy your Email: $selectedcodeVirifiy");
    await startResendVisibility();
  }
}
