part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {

}

class MainLoadingOnView extends MainState {
  final bool isShow;

  MainLoadingOnView({required this.isShow});
}
class MainLoadingOnButton extends MainState {
  final bool isShow;

  MainLoadingOnButton({required this.isShow});
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

class MainAccountDetailInFormVisibility extends MainState{
  final Account? account;
  final bool isShow;

  MainAccountDetailInFormVisibility({this.account, required this.isShow});
}

class MainUpdatedAccountSuccess extends MainState{
  final Account account;
  MainUpdatedAccountSuccess(this.account);
}
class MainUpdatedAccountFailed extends MainState{
  final String errorMessage;

  MainUpdatedAccountFailed({required this.errorMessage});
}


class MainLoadUserDataSuccess extends MainState{
  final UserData userData;
  MainLoadUserDataSuccess(this.userData);
}
class MainDeletedAccountSuccess extends MainState{
  final String message;
  MainDeletedAccountSuccess(this.message);
}

class MainAddPinnedActionSuccess extends MainState{
  final AccountingAction action;
  MainAddPinnedActionSuccess(this.action);
}
class MainRemovePinnedActionSuccess extends MainState{
  final AccountingAction action;
  MainRemovePinnedActionSuccess(this.action);
}
class MainActionToolbarVisibility extends MainState{
  final bool isShow;

  MainActionToolbarVisibility({required this.isShow});

}class ApiChange extends MainState{
  final ApiEnum apiEnum;

  ApiChange({required this.apiEnum});

}