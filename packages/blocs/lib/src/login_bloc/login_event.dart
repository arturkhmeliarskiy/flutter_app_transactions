part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {
  final String email;
  final String password;
  LoginInitEvent(this.email, this.password);
}
