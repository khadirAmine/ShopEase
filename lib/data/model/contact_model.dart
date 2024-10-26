import 'package:flutter/material.dart';

class ContactModel {
  ContactModel(
      {required this.icon,
      required this.uri,
      required this.color,
      required this.showLink});
  String icon, showLink;
  Uri uri;
  Color color;
}
