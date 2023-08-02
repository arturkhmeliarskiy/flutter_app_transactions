import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repositories/repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirestoreRepository _firestoreRepository;

  HomeBloc(this._firestoreRepository) : super(HomeLoadingState()) {
    on<HomeInitEvent>(_init);
    on<HomeRemoveItemEvent>(_removeItem);
  }

  Future<void> _init(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    List<TransactionDataModel> listReplenishment = [];
    List<TransactionDataModel> listTranslation = [];
    List<TransactionDataModel> listWithdrawal = [];

    final listTransaction =
        await _firestoreRepository.getTransactionsFireStore();

    listReplenishment = listTransaction
        .where(
          (element) => element.type == 'пополнение',
        )
        .toList();

    listTranslation = listTransaction
        .where(
          (element) => element.type == 'перевод',
        )
        .toList();

    listWithdrawal = listTransaction
        .where(
          (element) => element.type == 'снятие',
        )
        .toList();

    emit(HomeInitState(
      listTransaction: listTransaction,
      listReplenishment: listReplenishment,
      listTranslation: listTranslation,
      listWithdrawal: listWithdrawal,
    ));
  }

  Future<void> _removeItem(
    HomeRemoveItemEvent event,
    Emitter<HomeState> emit,
  ) async {
    List<TransactionDataModel> listReplenishment = [];
    List<TransactionDataModel> listTranslation = [];
    List<TransactionDataModel> listWithdrawal = [];
    List<TransactionDataModel> listTransaction = [];

    listTransaction = (state as HomeInitState).listTransaction;

    await _firestoreRepository.deleteDataFirestore(
      event.number,
    );

    listTransaction.removeAt(event.index);

    listReplenishment = listTransaction
        .where(
          (element) => element.type == 'пополнение',
        )
        .toList();

    listTranslation = listTransaction
        .where(
          (element) => element.type == 'перевод',
        )
        .toList();

    listWithdrawal = listTransaction
        .where(
          (element) => element.type == 'снятие',
        )
        .toList();

    emit(HomeInitState(
      listTransaction: listTransaction,
      listReplenishment: listReplenishment,
      listTranslation: listTranslation,
      listWithdrawal: listWithdrawal,
    ));
  }
}
