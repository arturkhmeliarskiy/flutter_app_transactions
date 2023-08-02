import 'package:models/models.dart';
import 'package:services/services.dart';

class FirestoreRepository {
  final FirestoreService firestoreService;

  FirestoreRepository(
    this.firestoreService,
  );

  Future<List<TransactionDataModel>> getTransactionsFireStore() async {
    final response = await firestoreService.getInfoFireStore();

    return List<TransactionDataModel>.from(
      response.map(
        (item) => TransactionDataModel.fromDocument(item),
      ),
    ).toList();
  }

  Future<void> deleteDataFirestore(
    String docPath,
  ) {
    return firestoreService.deleteDataFirestore(
      docPath,
    );
  }
}
