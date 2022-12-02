import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/consts/colors.dart';
import 'package:shop_getx_firebase/view/widgets/custom_elevated_button.dart';
import 'package:shop_getx_firebase/view/widgets/custom_sized_box.dart';
import 'package:shop_getx_firebase/view/widgets/custom_text.dart';
import '../auth_view/screens/signin_screen.dart';
import '../auth_view/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CustomText(
              text: 'Welcome Screen',
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: kBlack),
          const CustomSizedBox(height: 0.5, width: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                  onPressed: () {
                    Get.off(() => SignInScreen());
                  },
                  text: 'LOG IN',
                  height: 0.06,
                  width: 0.45,
                  backgroundColor: mainColor,
                  textColor: kWhite),
              CustomElevatedButton(
                  onPressed: () {
                    Get.off(() => SignUpScreen());
                  },
                  text: 'SIGN UP',
                  height: 0.06,
                  width: 0.45,
                  backgroundColor: mainColor,
                  textColor: kWhite),
            ],
          ),
          const CustomSizedBox(height: 0.06, width: 1)
        ],
      ),
    );
  }
}
