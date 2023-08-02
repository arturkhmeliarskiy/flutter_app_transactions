part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeRemoveItemEvent extends HomeEvent {
  final int index;
  final String number;
  HomeRemoveItemEvent({required this.index, required this.number});
}
