// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.textDecoration,
      this.maxLines,
      this.heightText,
      this.textAlign})
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final double? heightText;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
        height: heightText,
      ),
    );
  }
}
