import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/auth_controller.dart';
import 'package:shop_getx_firebase/core/controllers/cart_controller.dart';
import 'package:shop_getx_firebase/helper/local_storage_data.dart';
import '../core/controllers/data_controller.dart';
import '../core/controllers/profile_accont_controller.dart';
import '../core/controllers/view_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ViewController());
    Get.lazyPut(() => DataController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileAccountController());
  }
}
