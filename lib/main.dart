import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/auth_controller.dart';
import 'package:shop_getx_firebase/view/widgets/custom_circle_indicator.dart';
import 'consts/colors.dart';
import 'helper/bindings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  // CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: true,
              theme: ThemeData(
                scaffoldBackgroundColor: kWhite,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: kWhite,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: kWhite,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ),
              initialBinding: Binding(),
              home: const CustomCircleIndicator(),
            )));
  }
}
