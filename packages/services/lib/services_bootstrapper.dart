import 'package:get_it/get_it.dart';
import 'package:services/services.dart';

Future<void> initServices(GetIt getIt) async {
  getIt
    ..registerFactory(
      () => AuthService(),
    )
    ..registerFactory(
      () => FirestoreService(),
    );
}
