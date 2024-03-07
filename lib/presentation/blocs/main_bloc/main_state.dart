part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {
  final bool isShow;

   MainLoading({required this.isShow});
}

class AccountingActionsReceived extends MainState {
  final List<AccountingAction> actions;

  AccountingActionsReceived(this.actions);
}

class MainError extends MainState {
  final AppException appException;
  MainError(this.appException);
}
