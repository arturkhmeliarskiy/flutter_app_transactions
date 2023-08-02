import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_transactions/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is AppInitState) {
        return state.isAuthorized ? const HomeScreen() : const LoginScreen();
      } else {
        return const SizedBox();
      }
    });
  }
}
