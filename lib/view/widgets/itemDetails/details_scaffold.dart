import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScaffold extends StatelessWidget {
  const DetailsScaffold({super.key, this.appBar, this.body});

  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(children: [
        ClipPath(
          clipper: Clip1(),
          child: Container(
            color: Colors.blue,
            width: Get.width,
            height: Get.height * 0.27,
          ),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: body,
        )
      ]),
    );
  }
}

class Clip1 extends CustomClipper<Path> {
  final path = Path();
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.25, h - 100, w * 0.5, h - 50);
    path.quadraticBezierTo(w * 0.8, h, w, h - 50);
    path.lineTo(w, h);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
