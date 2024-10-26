import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/constants/variables.dart';

void changeLanguage(Locale language) {
  localeValue = language.toString();
  preferences.setString('localeValue', language.toString());
  Get.updateLocale(language);
}
