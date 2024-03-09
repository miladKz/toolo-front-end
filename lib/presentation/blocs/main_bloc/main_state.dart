part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingOnView extends MainState {
  final bool isShow;

  MainLoadingOnView({required this.isShow});
}


class AccountingActionsReceived extends MainState {
  final List<AccountingAction> actions;
  AccountingActionsReceived(this.actions);
}
class MainAccountReceived extends MainState {
  final List<Account> accounts;
  MainAccountReceived(this.accounts);
}
class MainError extends MainState {
  final AppException appException;
  MainError(this.appException);
}
