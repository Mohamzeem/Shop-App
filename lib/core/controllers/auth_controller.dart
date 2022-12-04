// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_getx_firebase/core/services/firestore_user_services.dart';
import 'package:shop_getx_firebase/model/user_model.dart';
import 'package:shop_getx_firebase/view/welcome_screen/welcome_screen.dart';
import '../../consts/colors.dart';
import '../../view/navigation_screens/screens/Control_screen.dart';

class AuthController extends GetxController {
  String? email, password, name;
  bool isVisible = true;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5));
    firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    firebaseUser.bindStream(_firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => ControlScreen());
  }

  void showPassword() {
    isVisible = !isVisible;
    update();
  }

  Future<void> googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
  }

  Future<void> facebookSignInMethod() async {
    final LoginResult loginResult =
        await _facebookAuth.login(permissions: ['email']);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    _firebaseAuth.signInWithCredential(facebookAuthCredential).then((user) {
      saveUser(user);
    });
  }

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: email!.trim(), password: password!.trim())
          .then((user) async {
        saveUser(user);
      });
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      snackBar(title, message);
    } catch (e) {
      snackBar('Error!!', e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: email!.trim(), password: password!.trim())
          .then((value) => print(value));
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      snackBar(title, message);
    } catch (e) {
      snackBar('Error!!', e.toString());
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUserServices().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name ?? user.user!.displayName,
      pic: '',
    ));
  }

  SnackbarController snackBar(String snackBarTitle, String snackBarMessage) =>
      Get.snackbar(
        snackBarTitle,
        snackBarMessage,
        snackPosition: SnackPosition.TOP,
        colorText: kBlack,
        backgroundColor: mainColor,
      );
}
