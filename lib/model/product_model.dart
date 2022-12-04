// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';
import 'package:shop_getx_firebase/consts/colors.dart';

class ProductModel {
  String? image, name, description, price, size, productId;
  Color? color;
  ProductModel(
      {this.image,
      this.name,
      this.description,
      this.price,
      this.size,
      this.color,
      this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    image = map['image'] ?? '';
    name = map['name'] ?? '';
    description = map['description'] ?? '';
    price = map['price'] ?? '';
    size = map['size'] ?? '';
    productId = map['productId'] ?? '';
    color = HexColor.fromHex(map['color']);
  }
  toJson() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'size': size,
      'color': color,
      'productId': productId,
    };
  }
}
