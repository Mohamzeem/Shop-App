import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/user_model.dart';

class FireStoreUserServices {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser({required String uid}) async {
    return await _userCollectionRef.doc(uid).get();
  }
}