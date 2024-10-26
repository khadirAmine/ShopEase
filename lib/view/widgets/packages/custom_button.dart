import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      this.withe,
      this.height,
      this.onTap,
      this.onLongPress,
      this.borderRadius,
      this.boxShadow,
      this.color,
      this.child,
      this.margin,
      this.alignment,
      this.padding});
  final double? withe;
  final double? height;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double paddingValue = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapUp: (TapUpDetails i) async {
        await animationbutton();
      },
      child: AnimatedContainer(
        width: widget.withe ?? Get.width * 0.3,
        height: widget.height ?? Get.height * 0.05,
        duration: const Duration(milliseconds: 120),
        padding: EdgeInsets.all(paddingValue),
        margin: widget.margin,
        alignment: Alignment.center,
        child: Center(
          child: Container(
              width: widget.withe ?? Get.width * 0.3,
              height: widget.height ?? Get.height * 0.05,
              alignment: widget.alignment,
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ??
                    const BorderRadius.all(Radius.circular(15)),
                boxShadow: widget.boxShadow ??
                    [
                      const BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 2.4,
                          offset: Offset(1, 1)),
                    ],
                gradient: LinearGradient(begin: const Alignment(1, 3), colors: [
                  Colors.black,
                  widget.color ?? Colors.blue,
                ]),
              ),
              child: Center(child: widget.child)),
        ),
      ),
    );
  }

  //! animation button
  Future<void> animationbutton() async {
    paddingValue = 2;
    setState(() {});
    await Future.delayed(
      const Duration(milliseconds: 120),
    );
    paddingValue = 0;
    setState(() {});
  }
}
