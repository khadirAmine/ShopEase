import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../config/constants/variables.dart';

Future getImageFromCamera() async {
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    File imageFile = File(photo.path);

    return imageFile;
  }
}

Future getImageFromGallery() async {
  final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
  if (photo != null) {
    File imageFile = File(photo.path);
    return imageFile;
  }
}
