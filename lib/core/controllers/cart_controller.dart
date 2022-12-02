import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/services/cart_database.dart';
import 'package:shop_getx_firebase/model/cart_product_model.dart';

class CartController extends GetxController {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  ValueNotifier<bool> get loading => _valueNotifier;

  List<CartProductModel> _list = [];
  List<CartProductModel> get cartProductModel => _list;

  var dbHelper = CartDatabase.db;
  CartController() {
    getAllProducts();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabase.db;
    await dbHelper.insert(cartProductModel);
    update();
  }

  getAllProducts() async {
    _valueNotifier.value = true;
    var dbHelper = CartDatabase.db;
    _list = await dbHelper.addAllProducts();
    print('_list.length is =  ${_list.length}');
    _valueNotifier.value = false;
    update();
  }
}
