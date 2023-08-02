import 'dart:developer';

import 'package:blocs/blocs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_transactions/bootstraper.dart';

import 'package:flutter_app_transactions/firebase_options.dart';
import 'package:flutter_app_transactions/screens/app/view/app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();

  await setupIoc();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log('Initialized default app $app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I.get<AppBloc>()
              ..add(
                AppInitEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<LoginBloc>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<HomeBloc>()
              ..add(
                HomeInitEvent(),
              ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppScreen(),
        ));
  }
}
