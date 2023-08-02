import 'package:blocs/blocs.dart';
import 'package:get_it/get_it.dart';
import 'package:repositories/repositories_bootstraper.dart';
import 'package:services/services_bootstrapper.dart';
import 'package:shared/shared.dart';

Future<void> setupIoc() async {
  final getIt = GetIt.I;
  await initShared(getIt);
  await initServices(getIt);
  await initRepositories(getIt);
  await initBloc(getIt);
}
