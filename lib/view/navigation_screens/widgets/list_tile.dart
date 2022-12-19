// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../consts/colors.dart';
import '../../widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        leading: Icon(
          icon,
          color: kBlack,
        ),
        title: CustomText(
          text: text,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: kBlack,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: kBlack,
            size: 20.r,
          ),
        ),
      ),
    );
  }
}
