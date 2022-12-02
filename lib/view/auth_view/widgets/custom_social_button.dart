// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.height,
    required this.width,
    this.widget,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final Widget? widget;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: widget!,
            ),
            CustomText(
              text: text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
