part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class MainInitial extends MainState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MainLoadingOnView extends MainState {
  final bool isShow;

  MainLoadingOnView({required this.isShow});

  List<Object?> get props => [];
}

class MainLoadingOnButton extends MainState {
  final bool isShow;

  MainLoadingOnButton({required this.isShow});

  List<Object?> get props => [];
}

class AccountingActionsSuccess extends MainState {
  final List<AccountingAction> actions;

  AccountingActionsSuccess(this.actions);

  List<Object?> get props => [];
}

class MainAccountSuccess extends MainState {
  final List<Account> accounts;

  MainAccountSuccess(this.accounts);

  List<Object?> get props => [];
}

class MainError extends MainState {
  final AppException appException;

  MainError(this.appException);

  List<Object?> get props => [];
}

class MainAccountDetailInFormVisibility extends MainState {
  final Account? account;
  final bool isShow;

  MainAccountDetailInFormVisibility({this.account, required this.isShow});

  @override
  List<Object> get props => [isShow, Random().nextInt(10000)];
}

class MainUpdatedAccountSuccess extends MainState {
  final Account account;

  MainUpdatedAccountSuccess(this.account);

  @override
  List<Object?> get props => [account];
}

class MainUpdatedAccountFailed extends MainState {
  final String errorMessage;

  MainUpdatedAccountFailed({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class MainLoadUserDataSuccess extends MainState {
  final UserData userData;

  MainLoadUserDataSuccess(this.userData);

  @override
  List<Object?> get props => [userData];
}

class MainDeletedAccountSuccess extends MainState {
  final String message;

  MainDeletedAccountSuccess(this.message);

  @override
  List<Object?> get props => [];
}

class MainAddPinnedActionSuccess extends MainState {
  final AccountingAction action;

  MainAddPinnedActionSuccess(this.action);

  @override
  List<Object?> get props => [action];
}

class MainRemovePinnedActionSuccess extends MainState {
  final AccountingAction action;

  MainRemovePinnedActionSuccess(this.action);

  @override
  List<Object?> get props => [action];
}

class MainActionToolbarVisibility extends MainState {
  final bool isShow;

  MainActionToolbarVisibility({required this.isShow});

  @override
  List<Object?> get props => [isShow, Random().nextInt(10000)];
}

class ApiChange extends MainState {
  final ApiEnum apiEnum;

  ApiChange({required this.apiEnum});

  @override
  List<Object?> get props => [apiEnum];
}

class SuccessCreateCounterparty extends MainState {
  final Counterparty counterparty;

  SuccessCreateCounterparty(this.counterparty);

  @override
  List<Object?> get props => [counterparty];
}

class FailedCreateCounterparty extends MainState {
  final String errorMessage;

  FailedCreateCounterparty({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessUpdateCounterparty extends MainState {
  final Counterparty counterparty;

  SuccessUpdateCounterparty(this.counterparty);

  @override
  List<Object?> get props => [counterparty];
}

class FailedUpdateCounterparty extends MainState {
  final String errorMessage;

  FailedUpdateCounterparty({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessDeletedCounterparty extends MainState {
  final String message;

  SuccessDeletedCounterparty(this.message);

  @override
  List<Object?> get props => [];
}

class FailedDeleteCounterparty extends MainState {
  final String errorMessage;

  FailedDeleteCounterparty({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
