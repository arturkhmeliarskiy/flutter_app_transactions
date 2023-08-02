part of 'app_bloc.dart';

abstract class AppState {}

class AppLoadingState extends AppState {}

class AppInitState extends AppState {
  final bool isAuthorized;

  AppInitState(this.isAuthorized);
}
