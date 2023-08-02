import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_transactions/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

import 'diagram_transactions.dart';
import 'list_transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.timeline)),
            ],
          ),
          actions: [
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeInitState) {
                return Row(
                  children: [
                    const Text(
                      'кол. транзакций:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.listTransaction.length.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            })
          ],
          title: const Text('Транзакции'),
        ),
        body: const TabBarView(
          children: [
            ListTransactions(),
            DiagramTransactions(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
            final shared = GetIt.I.get<SharedPreferencesService>();
            shared.clear();
          },
          child: const Icon(
            Icons.exit_to_app,
          ),
        ),
      ),
    );
  }
}
