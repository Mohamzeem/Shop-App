import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key? key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height!,
      width: MediaQuery.of(context).size.width * width!,
      child: child,
    );
  }
}
