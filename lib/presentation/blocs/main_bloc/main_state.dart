part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState{}

class AccountingSuccess extends MainState{

}

class MainError extends MainState{}