import 'dart:convert';

import 'package:crypto/crypto.dart';

Future<String> convertToSha1(String input) async {
  var bytes = utf8.encode(input);
  return sha1.convert(bytes).toString();
}
