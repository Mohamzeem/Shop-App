import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/services/cart_database.dart';
import 'package:shop_getx_firebase/model/cart_product_model.dart';

class CartController extends GetxController {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  ValueNotifier<bool> get loading => _valueNotifier;

  List<CartProductModel> _list = [];
  List<CartProductModel> get cartProductModel => _list;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabase.db;

  CartController() {
    getAllProducts();
  }

  getAllProducts() async {
    _valueNotifier.value = true;
    _list = await dbHelper.addAllProducts();
    print('_list.length is =  ${_list.length}');
    _valueNotifier.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _list.length; i++) {
      _totalPrice += (double.parse(_list[i].price!) * _list[i].quantity!);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insertProduct(cartProductModel);
    _list.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    update();
  }

  increaseQuantity(int index) async {
    _list[index].quantity = _list[index].quantity! + 1;
    _totalPrice += double.parse(_list[index].price!);
    await dbHelper.updateProduct(_list[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _list[index].quantity = _list[index].quantity! - 1;
    _totalPrice -= double.parse(_list[index].price!);
    await dbHelper.updateProduct(_list[index]);

    update();
  }
}
