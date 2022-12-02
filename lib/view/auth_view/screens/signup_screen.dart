import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/auth_controller.dart';
import '../../../../consts/colors.dart';
import '../../widgets/Custom_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import 'signin_screen.dart';

class SignUpScreen extends GetWidget<AuthController> {
  SignUpScreen({super.key});

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
                        text: 'SIGN UP',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => SignInScreen());
                        },
                        child: const CustomText(
                          text: 'Sign In',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    height: 0.06,
                    width: 1,
                  ),
                  CustomTextFF(
                    name: 'User Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        debugPrint(controller.name);
                        return 'Enter User name';
                      }
                    },
                    onSaved: (newValue) {
                      controller.name = newValue;
                    },
                    keyboardType: TextInputType.emailAddress,
                    label: "Enter User Name",
                    height: 0.07,
                    width: 1,
                    obscureText: false,
                  ),
                  const CustomSizedBox(
                    height: 0.02,
                    width: 1,
                  ),
                  CustomTextFF(
                    name: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        debugPrint(controller.email);
                        return 'Enter email';
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
                    obscureText: controller.isVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.showPassword();
                      },
                      icon: Icon(
                        controller.isVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: mainColor,
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    height: 0.05,
                    width: 1,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    text: 'SIGN UP',
                    height: 0.075,
                    width: 1,
                    backgroundColor: mainColor,
                    textColor: kWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
