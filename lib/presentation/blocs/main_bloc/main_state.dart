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

  @override
  List<Object?> get props => [isShow];
}

class MainLoadingOnButton extends MainState {
  final bool isShow;

  MainLoadingOnButton({required this.isShow});

  @override
  List<Object?> get props => [isShow];
}

class LoadingAvailableBankModalData extends MainState {
  final bool isShow;

  LoadingAvailableBankModalData({required this.isShow});

  List<Object?> get props => [];
}

class LoadingStandardDetailList extends MainState {
  final bool isShow;

  LoadingStandardDetailList({required this.isShow});

  List<Object?> get props => [];
}

class LoadedAvailableBankModalData extends MainState {
  final List<AvailableBank> availableBankList;

  LoadedAvailableBankModalData({required this.availableBankList});

  List<Object?> get props => [];
}

class LoadedStandardDetails extends MainState {
  final List<StandardDetail> standardDetailList;

  LoadedStandardDetails({required this.standardDetailList});

  List<Object?> get props => [];
}

class AccountingActionsSuccess extends MainState {
  final List<AccountingAction> actions;

  AccountingActionsSuccess(this.actions);

  @override
  List<Object?> get props => [];
}

class MainAccountSuccess extends MainState {
  final List<Account> accounts;

  MainAccountSuccess(this.accounts);

  @override
  List<Object?> get props => [];
}

class MainError extends MainState {
  final AppException appException;

  MainError(this.appException);

  @override
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
  List<Object?> get props => [apiEnum, Random().nextInt(100000)];
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

class CreateDocumentMasterStatus extends MainState {
  final bool isSuccess;

  CreateDocumentMasterStatus({required this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}

class SuccessFetchAccountHaveTafziliGroup extends MainState {
  final List<AccountHaveTafziliGroup> items;

  SuccessFetchAccountHaveTafziliGroup({required this.items});

  @override
  List<Object?> get props => [items];
}
class SuccessFetchTafziliGroupAndChildList extends MainState {
  final List<TafziliGroupAndChildren> items;

  SuccessFetchTafziliGroupAndChildList({required this.items});


  @override
  List<Object?> get props => [items];
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

class SuccessCreateStandardDetail extends MainState {
  final StandardDetail standardDetail;

  SuccessCreateStandardDetail(this.standardDetail);

  @override
  List<Object?> get props => [standardDetail];
}

class FailedCreateStandardDetail extends MainState {
  final String errorMessage;

  FailedCreateStandardDetail({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessUpdateStandardDetail extends MainState {
  final StandardDetail standardDetail;

  SuccessUpdateStandardDetail(this.standardDetail);

  @override
  List<Object?> get props => [standardDetail];
}

class FailedUpdateStandardDetail extends MainState {
  final String errorMessage;

  FailedUpdateStandardDetail({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class LoadedCityList extends MainState {
  final List<City> cityList;

  LoadedCityList({required this.cityList});

  @override
  List<Object?> get props => cityList;
}

class SuccessLoadCustomerDetail extends MainState {
  final List<CounterpartyDetail> detailList;

  SuccessLoadCustomerDetail({required this.detailList});

  @override
  List<Object?> get props => [detailList];
}

class SuccessLoadCustomerAddress extends MainState {
  final List<CounterpartyDetail> addressList;

  SuccessLoadCustomerAddress({required this.addressList});

  @override
  List<Object?> get props => [addressList];
}

class FailedLoadCustomerDetail extends MainState {
  final String errorMessage;

  FailedLoadCustomerDetail({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessCreateCustomerDetail extends MainState {
  final CounterpartyDetail counterpartyDetail;

  SuccessCreateCustomerDetail(this.counterpartyDetail);

  @override
  List<Object?> get props => [counterpartyDetail];
}

class FailedCreateCustomerDetail extends MainState {
  final String errorMessage;

  FailedCreateCustomerDetail({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessUpdateCustomerDetail extends MainState {
  final CounterpartyDetail counterpartyDetail;

  SuccessUpdateCustomerDetail(this.counterpartyDetail);

  @override
  List<Object?> get props => [counterpartyDetail];
}

class FailedUpdateCustomerDetail extends MainState {
  final String errorMessage;

  FailedUpdateCustomerDetail({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessDeleteCustomerDetail extends MainState {
  final CounterpartyDetail counterpartyDetail;

  SuccessDeleteCustomerDetail(this.counterpartyDetail);

  @override
  List<Object?> get props => [counterpartyDetail];
}

class FailedDeleteCustomerDetail extends MainState {
  final String errorMessage;

  FailedDeleteCustomerDetail({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
class FailedSyncCustomerDetail extends MainState {
  final String errorMessage;

  FailedSyncCustomerDetail({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class SuccessFetchBaseDataModel extends MainState {
  final BaseDataModel baseDataModel;

  SuccessFetchBaseDataModel({required this.baseDataModel});

  @override
  List<Object?> get props => [baseDataModel];
}
