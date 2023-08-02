import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/shared.dart';

class FirestoreService {
  Future<List<DocumentSnapshot>> getInfoFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<DocumentSnapshot> result = [];
    QuerySnapshot? response;

    try {
      response = await firebaseFirestore
          .collection(FirestoreConstants.transactions)
          .get();

      result = response.docs;
    } on FirebaseException catch (e) {
      log(e.message ?? '');
    }

    return result;
  }

  Future<void> deleteDataFirestore(
    String path,
  ) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return firebaseFirestore
        .collection(FirestoreConstants.transactions)
        .doc(path)
        .delete();
  }
}
