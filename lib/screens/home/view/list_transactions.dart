import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_transactions/screens/description/view/description_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTransactions extends StatefulWidget {
  const ListTransactions({super.key});

  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeInitState) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.listTransaction.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionScreen(
                        transaction: state.listTransaction[index],
                        index: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  trailing: Text(state.listTransaction[index].amount),
                  title: Row(
                    children: [
                      Text('№ ${state.listTransaction[index].number}'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(state.listTransaction[index].type),
                    ],
                  ),
                ),
              );
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
