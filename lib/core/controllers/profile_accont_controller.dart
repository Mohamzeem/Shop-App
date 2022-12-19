import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_getx_firebase/helper/local_storage_data.dart';
import '../../model/user_model.dart';
import '../../view/welcome_screen/welcome_screen.dart';

class ProfileAccountController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await localStorageData.signOut();
    Get.offAll(() => const WelcomeScreen());
    // ignore: avoid_print
    print('Sign Out Successfully');
  }

  void getCurrentUser() async {
    _userModel = LocalStorageData.getUserInfo;
    update();
  }
}
