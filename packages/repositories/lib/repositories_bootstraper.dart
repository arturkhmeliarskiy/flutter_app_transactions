import 'package:get_it/get_it.dart';
import 'package:repositories/repositories.dart';
import 'package:services/services.dart';

Future<void> initRepositories(GetIt getIt) async {
  getIt
    ..registerSingleton(
      AuthRepository(
        getIt.get<AuthService>(),
      ),
    )
    ..registerSingleton(
      FirestoreRepository(
        getIt.get<FirestoreService>(),
      ),
    );
}
