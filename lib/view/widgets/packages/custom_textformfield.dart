import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.controller,
    this.focusNode,
    this.validator,
    this.onTapOutside,
    this.counter,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.maxHeight,
    this.maxWidth,
    this.minHeight,
    this.minWidth,
    this.margin,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.labelStyle,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.hinitText,
  });
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String value)? onChanged;
  final Widget? counter;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final double? maxHeight;
  final double? maxWidth;
  final double? minHeight;
  final double? minWidth;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? labelStyle;
  final int? maxLines;
  final int? minLines;
  final String? hinitText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        cursorErrorColor: Colors.red,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
            hintText: hinitText,
            labelStyle: labelStyle,
            suffixIcon: suffixIcon,
            filled: true,
            isDense: true,
            labelText: labelText,
            counter: counter,
            fillColor: fillColor,
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? Get.height * 0.08,
              maxWidth: maxWidth ?? Get.width * 0.85,
              minHeight: minHeight ?? Get.height * 0.06,
              minWidth: minWidth ?? 0.0,
            ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[400]!,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(200))),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[700]!,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(200))),
            errorBorder: errorBorder ??
                const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(200))),
            focusedErrorBorder: focusedErrorBorder ??
                const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(200)))),
      ),
    );
  }
}
