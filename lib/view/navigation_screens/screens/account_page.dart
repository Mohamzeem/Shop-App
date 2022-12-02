import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/consts/colors.dart';
import 'package:shop_getx_firebase/core/controllers/auth_controller.dart';
import 'package:shop_getx_firebase/view/widgets/custom_sized_box.dart';
import 'package:shop_getx_firebase/view/widgets/custom_text.dart';
import '../../widgets/custom_elevated_button.dart';

class AccountScreen extends GetWidget<AuthController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Account Screen',
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: kBlack,
          ),
          const CustomSizedBox(height: 0.1, width: 1),
          CustomElevatedButton(
              onPressed: () {
                controller.signOut();
              },
              text: 'SIGN OUT',
              height: 0.06,
              width: 0.45,
              backgroundColor: mainColor,
              textColor: kWhite),
        ],
      ),
    );
  }
}
