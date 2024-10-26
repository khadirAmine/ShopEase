import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.boxShadow,
      this.borderRadius,
      this.child,
      this.alignment,
      this.margin,
      this.padding,
      this.onTap});
  final double? height;
  final double? width;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            color: color ?? Colors.blue[400],
            boxShadow: boxShadow ??
                const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      spreadRadius: -2,
                      blurRadius: 6)
                ],
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12))),
        child: child,
      ),
    );
  }
}
