import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/auth_controller.dart';
import 'package:shop_getx_firebase/view/auth_view/widgets/custom_social_button.dart';
import '../../../../consts/colors.dart';
import '../../widgets/Custom_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import 'signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends GetWidget<AuthController> {
  SignInScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: 'Welcome,',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => SignUpScreen());
                        },
                        child: const CustomText(
                          text: 'Sign Up',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    height: 0.01,
                    width: 1,
                  ),
                  const CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: kGrey,
                  ),
                  const CustomSizedBox(
                    height: 0.05,
                    width: 1,
                  ),
                  CustomTextFF(
                    name: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        debugPrint(controller.email);
                        return 'Enter Password';
                      }
                    },
                    onSaved: (newValue) {
                      controller.email = newValue;
                    },
                    keyboardType: TextInputType.emailAddress,
                    label: "Enter Email",
                    height: 0.07,
                    width: 1,
                    obscureText: false,
                  ),
                  const CustomSizedBox(
                    height: 0.02,
                    width: 1,
                  ),
                  CustomTextFF(
                    name: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        debugPrint(controller.password);
                        return 'Enter Password';
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    label: "Enter Password",
                    height: 0.07,
                    width: 1,
                    onSaved: (newValue) {
                      controller.password = newValue;
                    },
                    obscureText: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (() {}),
                        child: const CustomText(
                          text: 'Forgot Password',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: kBlack,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    height: 0.01,
                    width: 1,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    text: 'SIGN IN',
                    height: 0.075,
                    width: 1,
                    backgroundColor: mainColor,
                    textColor: kWhite,
                  ),
                  const CustomSizedBox(
                    height: 0.04,
                    width: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(
                        text: '_OR_',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: kBlack,
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    height: 0.04,
                    width: 1,
                  ),
                  CustomSocialButton(
                      onPressed: () {
                        controller.facebookSignInMethod();
                      },
                      text: '       Sign In with Facebook',
                      height: 0.075,
                      width: 1,
                      backgroundColor: Colors.grey.shade100,
                      textColor: kBlack,
                      widget: Image.asset('assets/facebook.png')),
                  const CustomSizedBox(
                    height: 0.02,
                    width: 1,
                  ),
                  CustomSocialButton(
                      onPressed: () {
                        controller.googleSignInMethod();
                      },
                      text: '       Sign In with Google',
                      height: 0.075,
                      width: 1,
                      backgroundColor: Colors.grey.shade100,
                      textColor: kBlack,
                      widget: Image.asset('assets/google.png')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
