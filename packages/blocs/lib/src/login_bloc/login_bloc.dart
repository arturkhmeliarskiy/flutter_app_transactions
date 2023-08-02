import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/shared.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final SharedPreferencesService _sharedPreferencesService;

  LoginBloc(
    this._authRepository,
    this._sharedPreferencesService,
  ) : super(LoginLoadingState()) {
    on<LoginInitEvent>(_init);
  }

  Future<void> _init(
    LoginInitEvent event,
    Emitter<LoginState> emit,
  ) async {
    final result = await _authRepository.signIn(
      event.email,
      event.password,
    );

    if (result != null) {
      await _sharedPreferencesService.setBool(
          key: SharedPrefKeys.userAuthorized, value: true);
      emit(LoginSuccessfulState());
    } else {
      emit(LoginErrorState());
    }
  }
}
