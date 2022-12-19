import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_getx_firebase/model/user_model.dart';

class LocalStorageData extends GetxController {
  static final GetStorage _appBox = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static Future<void> write(
      {required String key, required dynamic value}) async {
    return await _appBox.write(key, value);
  }

  static dynamic read({required String key}) {
    return _appBox.read(key);
  }

  static bool hasData({required String key}) {
    return _appBox.hasData(key);
  }

  //===============================================================
  static Future<void> cacheUserInfo({
    required String token,
    required UserModel userModel,
  }) async {
    await _cacheUserToken(token);
    await _cacheUser(userModel);
  }

  Future<void> cacheUser({
    required UserModel userModel,
  }) async {
    await _cacheUser(userModel);
  }

  static Future<void> _cacheUser(UserModel userModel) async =>
      await _appBox.write('userModel', userModel.toJson());

  static Future<void> _cacheUserToken(String token) async =>
      await _appBox.write('token', token);

  static String? get getUserToken => _appBox.read('token');

  static bool get isLogged => getUserInfo != null;

  static UserModel? get getUserInfo {
    UserModel? userModel;
    try {
      if (_appBox.hasData('userModel')) {
        userModel = UserModel.fromJson(_appBox.read('userModel'));
      }
    } catch (e) {
      print(e.toString());
    }
    return userModel;
  }

  Future<void> signOut() async => await _appBox.erase();

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Future<UserModel?> getUserData(UserModel userModel) async {
  //   final SharedPreferences prefs = await _prefs;
  //   var value = prefs.getString(cashedUserData);
  //   try {
  //     if (value == null) {
  //       return null;
  //     } else {
  //       return UserModel.fromJson(json.decode(value));
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e.toString());
  //   }
  //   return null;
  // }

  // Future<void> setUserData(UserModel userModel) async {
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.setString(cashedUserData, json.encode(userModel.toJson()));
  // }

  // Future<void> deleteUserData() async {
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.clear();
  // }

}
