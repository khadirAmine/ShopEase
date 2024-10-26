import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchuri(Uri uri) async {
  try {
    if (!await launchUrl(uri)) {
      throw Exception('${'Could not launch'.tr} ${uri.path}');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
