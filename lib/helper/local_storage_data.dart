import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_getx_firebase/consts/txt.dart';
import 'package:shop_getx_firebase/model/user_model.dart';

class LocalStorageData extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserModel?> getUserData(UserModel userModel) async {
    final SharedPreferences prefs = await _prefs;
    var value = prefs.getString(cashedUserData);
    try {
      if (value == null) {
        return null;
      } else {
        return UserModel.fromJson(json.decode(value));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Future<void> setUserData(UserModel userModel) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(cashedUserData, json.encode(userModel.toJson()));
  }

  Future<void> deleteUserData() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
