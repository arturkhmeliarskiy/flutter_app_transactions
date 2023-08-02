import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SharedPreferencesService _sharedPreferencesService;

  AppBloc(this._sharedPreferencesService) : super(AppLoadingState()) {
    on<AppInitEvent>(_init);
  }

  Future<void> _init(
    AppInitEvent event,
    Emitter<AppState> emit,
  ) async {
    final isAuthorized = await _sharedPreferencesService.getBool(
            key: SharedPrefKeys.userAuthorized) ??
        false;

    emit(AppInitState(isAuthorized));
  }
}
