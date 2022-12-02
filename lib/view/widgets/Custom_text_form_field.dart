// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../consts/colors.dart';
import 'custom_sized_box.dart';
import 'custom_text.dart';

class CustomTextFF extends StatelessWidget {
  const CustomTextFF({
    Key? key,
    required this.name,
    // this.controller,
    required this.validator,
    required this.onSaved,
    required this.obscureText,
    required this.keyboardType,
    required this.label,
    this.suffixIcon,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String name;
  // final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String?) onSaved;
  final bool obscureText;
  final TextInputType keyboardType;
  final String label;
  final Widget? suffixIcon;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: name,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: kBlack),
        const CustomSizedBox(
          height: 0.007,
          width: 1,
        ),
        CustomSizedBox(
          height: height,
          width: width,
          child: TextFormField(
            onSaved: (newValue) => onSaved(newValue),
            validator: (value) => validator(value),
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            cursorColor: Colors.green[600],
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              fillColor: Colors.grey.shade100,
              filled: true,
              label: CustomText(
                  text: label,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: kGrey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
