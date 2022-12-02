import 'package:flutter/material.dart';
import 'package:shop_getx_firebase/consts/colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(
            backgroundColor: mainColor,
            color: mainColor,
            semanticsLabel: 'Loading..',
            strokeWidth: 5,
          ),
        ));
  }
}
