// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/services/data_services.dart';
import 'package:shop_getx_firebase/model/category_model.dart';
import 'package:shop_getx_firebase/model/product_model.dart';

class DataController extends GetxController {
  bool? isLoading;
  DataController() {
    getCategory();
    getbestSelling();
  }

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  void getCategory() async {
    isLoading = true;
    await DataServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
        // print(categoryModel.length);
        isLoading = false;
      }
      update();
    });
  }

  List<ProductModel> get productModel => _poductModel;
  final List<ProductModel> _poductModel = [];

  void getbestSelling() async {
    isLoading = true;
    await DataServices().getbestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _poductModel.add(ProductModel.fromJson(value[i].data() as Map));
        print(productModel.length);
        isLoading = false;
      }
      update();
    });
  }

  // final CollectionReference students =
  //     FirebaseFirestore.instance.collection('Students');

  // addStudents() {
  //   students.add({
  //     'name': tname,
  //     'grade': tgrade,
  //   }).then((value) => print('Student Added'));
  // }

  // addStudentsWithDoc(String addDoc) {
  //   students.doc(addDoc).set({
  //     'name': tname,
  //     'grade': tgrade,
  //   }).then((value) => print('Student Added'));
  // }

  // updateStudentsWithDoc(String updateDoc) {
  //   students.doc(updateDoc).update({
  //     'name': tname,
  //     'grade': tgrade,
  //   }).then((value) => print('Student Updated'));
  // }

  // deleteStudentsWithDoc(String updateDoc) {
  //   students.doc(updateDoc).delete().then((value) => print('Student Deleted'));
  // }
}
