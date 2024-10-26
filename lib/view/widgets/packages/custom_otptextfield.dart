import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class CustomOTPTextField extends StatefulWidget {
  const CustomOTPTextField({
    super.key,
    this.controller,
    this.backgroundColor,
    this.width,
    this.fieldStyle = FieldStyle.box,
    this.fieldWidth = 41.142857142857146,
    this.otpFieldStyle,
    this.hasError = false,
    this.onChanged,
    this.onCompleted,
  });
  final OtpFieldController? controller;
  final Color? backgroundColor;
  final double? width;
  final FieldStyle fieldStyle;
  final double fieldWidth;
  final OtpFieldStyle? otpFieldStyle;
  final void Function(String value)? onChanged;
  final void Function(String value)? onCompleted;
  final bool hasError;
  @override
  State<CustomOTPTextField> createState() => _CustomOTPTextFieldState();
}

class _CustomOTPTextFieldState extends State<CustomOTPTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Colors.white,
      width: widget.width ?? Get.width * 0.5,
      child: OTPTextField(
        onChanged: widget.onChanged,
        onCompleted: widget.onCompleted,
        fieldStyle: widget.fieldStyle,
        fieldWidth: widget.fieldWidth,
        otpFieldStyle: widget.otpFieldStyle ??
            OtpFieldStyle(
              borderColor: Colors.blue,
              enabledBorderColor: Colors.blue,
              focusBorderColor: Colors.indigo,
            ),
        controller: widget.controller,
        hasError: widget.hasError,
      ),
    );
  }
}
