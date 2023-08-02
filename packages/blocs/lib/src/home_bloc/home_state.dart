part of 'home_bloc.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {
  final List<TransactionDataModel> listTransaction;
  final List<TransactionDataModel> listWithdrawal;
  final List<TransactionDataModel> listReplenishment;
  final List<TransactionDataModel> listTranslation;

  HomeInitState({
    required this.listTransaction,
    required this.listWithdrawal,
    required this.listReplenishment,
    required this.listTranslation,
  });
}
