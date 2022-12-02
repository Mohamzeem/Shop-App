import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('Categories');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionReference.get();
    return value.docs;
  }

  final CollectionReference _productCollectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getbestSelling() async {
    var value = await _productCollectionReference.get();
    return value.docs;
  }
}
