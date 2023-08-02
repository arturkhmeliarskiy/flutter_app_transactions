import 'package:blocs/blocs.dart';
import 'package:get_it/get_it.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/shared.dart';

Future<void> initBloc(GetIt getIt) async {
  getIt
    ..registerSingleton(
      AppBloc(
        getIt.get<SharedPreferencesService>(),
      ),
    )
    ..registerSingleton(
      LoginBloc(
        getIt.get<AuthRepository>(),
        getIt.get<SharedPreferencesService>(),
      ),
    )
    ..registerSingleton(
      HomeBloc(
        getIt.get<FirestoreRepository>(),
      ),
    );
}
