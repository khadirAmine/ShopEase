import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';

import '../../view/widgets/packages/custom_button.dart';
import '../constants/enums.dart';
import '../constants/variables.dart';
import '../functions/checkinternet.dart';

class Crud {
  //! Post Data
  Future postData(String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var request = jsonDecode(jsonEncode(response.body));
          return request;
        } else {
          appStatus = AppStatus.server;
          Get.defaultDialog(
              title: 'server'.tr,
              content: Text('An error in The server.'.tr),
              confirm: CustomButton(
                onTap: () {
                  Get.back();
                },
                withe: Get.width * 0.15,
                height: Get.height * 0.04,
                child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
              ));
        }
      }
    } catch (e) {
      appStatus = AppStatus.error;
      Get.defaultDialog(
          title: 'Error'.tr,
          content: Text('$e'),
          confirm: CustomButton(
            onTap: () {
              Get.back();
            },
            withe: Get.width * 0.15,
            height: Get.height * 0.04,
            child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
          ));
    }
  }

//! Get Data
  Future getData(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var request = jsonDecode(jsonEncode(response.body));
        return request;
      } else {
        appStatus = AppStatus.server;
        Get.defaultDialog(
            title: 'server'.tr,
            content: Text('An error in The server.'.tr),
            confirm: CustomButton(
              onTap: () {
                Get.back();
              },
              withe: Get.width * 0.15,
              height: Get.height * 0.04,
              child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
            ));
      }
    } catch (e) {
      appStatus = AppStatus.error;
      Get.defaultDialog(
          title: 'Error'.tr,
          content: Text('$e'),
          confirm: CustomButton(
            onTap: () {
              Get.back();
            },
            withe: Get.width * 0.15,
            height: Get.height * 0.04,
            child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
          ));
    }
  }

//! Upload File
  Future uploadeFile(String url, File file, Map<String, dynamic> data,
      {String? fileRequestName}) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        Stream<List<int>> stream = http.ByteStream(file.openRead());
        int length = await file.length();
        var multiPartFile = http.MultipartFile(
            fileRequestName ?? 'image', stream, length,
            filename: basename(file.path));
        request.files.add(multiPartFile);
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        StreamedResponse? sendRequest = await request.send();

        var response = await http.Response.fromStream(sendRequest);
        if (sendRequest.statusCode == 200 || response.statusCode == 201) {
          return jsonDecode(jsonEncode(response.body));
        }
      } else {
        appStatus = AppStatus.server;
        Get.defaultDialog(
            title: 'server'.tr,
            content: Text('An error in The server.'.tr),
            confirm: CustomButton(
              onTap: () {
                Get.back();
              },
              withe: Get.width * 0.15,
              height: Get.height * 0.04,
              child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
            ));
      }
    } catch (e) {
      appStatus = AppStatus.error;
      Get.defaultDialog(
          title: 'Error'.tr,
          content: Text('$e'),
          confirm: CustomButton(
            onTap: () {
              Get.back();
            },
            withe: Get.width * 0.15,
            height: Get.height * 0.04,
            child: Text('Ok'.tr, style: const TextStyle(fontSize: 17)),
          ));
    }
  }
}
