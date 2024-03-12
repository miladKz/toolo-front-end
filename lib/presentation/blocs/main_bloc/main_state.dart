part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingOnView extends MainState {
  final bool isShow;

  MainLoadingOnView({required this.isShow});
}

class AccountingActionsSuccess extends MainState {
  final List<AccountingAction> actions;

  AccountingActionsSuccess(this.actions);
}

class MainAccountSuccess extends MainState {
  final List<Account> accounts;

  MainAccountSuccess(this.accounts);
}

class MainError extends MainState {
  final AppException appException;

  MainError(this.appException);
}

class ShowAccountDetailInFormState extends MainState{
  final Account account;
  ShowAccountDetailInFormState(this.account);
}

class SuccessUpdatedAccountState extends MainState{
  final Account account;
  SuccessUpdatedAccountState(this.account);
}
