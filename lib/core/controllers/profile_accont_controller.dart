import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/welcome_screen/welcome_screen.dart';

class ProfileAccountController extends GetxController {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    Get.offAll(() => const WelcomeScreen());
    // ignore: avoid_print
    print('Sign Out Successfully');
  }
}
