import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading(
      {super.key,
      this.child,
      required this.isLoading,
      this.onTap,
      required this.size,
      this.color});

  final Widget? child;
  final RxBool isLoading;
  final void Function()? onTap;
  final double size;
  final Color? color;
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: widget.onTap,
        child: widget.isLoading.value
            ? LoadingAnimationWidget.inkDrop(
                color: widget.color ?? Colors.white,
                size: widget.size,
              )
            : widget.child));
  }
}
