import 'dart:io';

import '../../data/remote/api_remote.dart';
import '../config/constants/enums.dart';
import 'get_image.dart';

Future addUserProfileImage(int userId, String email,
    {ImageSouress? imageSource}) async {
  File? imageFile;
  if (imageSource == ImageSouress.camera) {
    imageFile = await getImageFromCamera();
  } else if (imageSource == ImageSouress.gallery) {
    imageFile = await getImageFromGallery();
  }

  if (imageFile != null) {
    await ApiRemote.insertUserImage(imageFile, userId);
  }
  List data = await ApiRemote.selectUserData(email);
  String imageName = data[0]['user_image'];
  return imageName;
}
