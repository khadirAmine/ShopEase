import 'dart:convert';
import 'dart:io';

import '../../core/class/crud.dart';
import '../../core/constants/api_links.dart';

Crud crud = Crud();

class ApiRemote {
  static Future selectUserData(String email) async {
    var request = await crud.postData(selectUserDataLink, {'email': email});
    return jsonDecode(request);
  }

  static Future selectAllData(String tableName) async {
    var request =
        await crud.postData(selectAllDataLink, {'tableName': tableName});
    return jsonDecode(request);
  }

  static Future checkEmailExists(String email) async {
    var request = await crud.postData(checkEmailExistsLink, {'email': email});
    try {
      if (num.parse(request) > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future sendEmail(String email, subject, body) async {
    var request = await crud.postData(
        sendEmailLink, {'email': email, 'subject': subject, 'body': body});
    return request;
  }

  static Future<int> selectVirificationCodeFunctoin(String email) async {
    var request =
        await crud.postData(selectCodeVirificationLink, {'email': email});
    return jsonDecode(request)[0]['user_codevirifiy'];
  }

  static Future<bool> checkEmailValidation(String email) async {
    var request = await crud.postData(selectValidationLink, {'email': email});
    if (jsonDecode(request)[0]['user_valid'] == 1) {
      return true;
    } else {
      return false;
    }
  }

  static Future selectBy(String url, tableName, id) async {
    var request = await crud.postData(url, {'tableName': tableName, 'id': id});
    return jsonDecode(request);
  }

  static Future searchItem(String language, word) async {
    var request = await crud
        .postData(searchItemLink, {'language': language, 'word': word});
    return jsonDecode(request);
  }

  static Future selectItemData() async {
    var request = await crud.getData(selectItemDataLink);
    return jsonDecode(request);
  }

  static Future selectItemCategorie(String id) async {
    var request = await crud.postData(selectItemCategorieLink, {'id': id});
    return jsonDecode(request);
  }

  static Future addFavorite(int userId, itemId) async {
    await crud.postData(addFavoriteLink,
        {'userId': userId.toString(), 'itemId': itemId.toString()});
  }

  static Future selectFavorite(int userId) async {
    var request = await crud
        .postData(selectFavoriteDataLink, {'userId': userId.toString()});
    return jsonDecode(request);
  }

  static Future deletFavorite(int userId, itemId) async {
    var request = await crud.postData(deletFavoriteLink,
        {'userId': userId.toString(), 'itemId': itemId.toString()});
    return jsonDecode(request);
  }

  static Future selectFavoriteItem(int itemId) async {
    var request = await crud
        .postData(selectFavoriteItemLink, {'itemId': itemId.toString()});
    return jsonDecode(request);
  }

  static Future searchFavorite(String language, word, int userId) async {
    var request = await crud.postData(searchFavoriteLink,
        {'language': language, 'word': word, 'userId': userId.toString()});
    return jsonDecode(request);
  }

  static Future insertUserImage(File file, int userId) async {
    var request =
        await crud.uploadeFile(insertUserImageLink, file, {'userId': userId});
    return request;
  }

  static Future deleteUserPrfileImage(String imageName, int userId) async {
    var request = await crud.postData(deleteUserProfileImageLink,
        {'imageName': imageName, 'userId': userId.toString()});
    return request;
  }

  static Future insertOrder(int userId, int itemId) async {
    var request = await crud.postData(insertOrderLink,
        {'userId': userId.toString(), 'itemId': itemId.toString()});
    return request;
  }

  static Future selectOrderData(int userId) async {
    var request =
        await crud.postData(selectOrderDatalink, {'userId': userId.toString()});
    return jsonDecode(request);
  }

  static Future selectOrderCount(int userId, int itemId) async {
    var request = await crud.postData(selectOrderCountLink,
        {'userId': userId.toString(), 'itemId': itemId.toString()});
    return jsonDecode(request)[0]['order_count'];
  }

  static Future deleteOrder(int orderId) async {
    var request =
        await crud.postData(deleteOrderLink, {'orderId': orderId.toString()});
    return request;
  }

  static Future deleteAllOrders(int userId, int itemId) async {
    var request = await crud.postData(deletAllOrdersLink,
        {'userId': userId.toString(), 'itemId': itemId.toString()});
    return request;
  }

  static Future insertComment(int userId, String commentText) async {
    var request = await crud.postData(insertCommentLink,
        {'userId': userId.toString(), 'commentText': commentText});
    return request;
  }
}
