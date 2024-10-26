import 'package:flutter/material.dart';

import '../../../core/config/constants/assets.dart';
import '../../model/contact_model.dart';
import '../../model/onboarding_model.dart';

List<OnboardingModel> onbordingList = [
  OnboardingModel('choose Your Product', ImagesAsset.onbording1,
      'we have a 100k+ Products. Choose\n your product from our E-\ncommerce shope.'),
  OnboardingModel('Easy & Sage Payment', ImagesAsset.onbording2,
      'Easy checkout & Sate payment\n mathed. Trusted by Our Customers\n from all over the world.'),
  OnboardingModel("Track Your Order", ImagesAsset.onbording3,
      "Best Tracker has been User for\n For track your order. You'll know where\n your product is at the moment."),
  OnboardingModel('Fast Deliveryl', ImagesAsset.onbording4,
      'Reliable And Fast Delivery. We\n Delivrey your product the fastest\n way possible.')
];

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

List<ContactModel> contactItems = [
  ContactModel(
      icon: IconAsset.whatsapp,
      uri: Uri.parse('https://wa.me/+212777591194'),
      color: const Color.fromARGB(255, 185, 247, 217),
      showLink: '+212 777591194'),
  ContactModel(
      icon: IconAsset.gmail,
      uri: Uri(
        scheme: 'mailto',
        path: 'mohammedaminekhadir6@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'your project',
        }),
      ),
      color: const Color.fromARGB(255, 247, 217, 185),
      showLink: 'mohammedaminekhadir6@gmail.com'),
  ContactModel(
      icon: IconAsset.phone,
      uri: Uri.parse('tel:+212777591194'),
      color: const Color.fromARGB(255, 185, 247, 217),
      showLink: '+212 777591194'),
  ContactModel(
      icon: IconAsset.linkeding,
      uri: Uri.parse(
          'https://www.linkedin.com/in/mohammed-amine-khadir-0129352a6/'),
      color: const Color.fromARGB(255, 185, 218, 247),
      showLink: 'mohammed amine khadir'),
  ContactModel(
      icon: IconAsset.github,
      uri: Uri.parse('https://github.com/mohammedaminekhadir'),
      color: const Color.fromARGB(255, 197, 201, 204),
      showLink: 'mohammed amine khadir'),
];
