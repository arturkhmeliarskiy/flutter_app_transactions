part of 'login_bloc.dart';

abstract class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessfulState extends LoginState {}

class LoginErrorState extends LoginState {}
