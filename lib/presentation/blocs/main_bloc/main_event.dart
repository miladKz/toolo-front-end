part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainActionList extends MainEvent {}

class MainAccountList extends MainEvent {}

class MainAnotherList extends MainEvent {
  final String endpoint;
  final ApiEnum apiEnum;

  MainAnotherList({required this.endpoint, required this.apiEnum});
}

class FilterActionsEvent extends MainEvent {
  final WorkSpaceItems selectedItem;

  FilterActionsEvent(this.selectedItem);
}

class OnClickOnAccount extends MainEvent {
  final Account account;

  OnClickOnAccount(this.account);
}

class OnUpdateAccount extends MainEvent {
  final Account account;

  OnUpdateAccount(this.account);
}

class LoadUserData extends MainEvent {}

class DeleteAccountEvent extends MainEvent {
  final Account account;

  DeleteAccountEvent(this.account);
}

class AddPinnedActionEvent extends MainEvent {
  final AccountingAction action;

  AddPinnedActionEvent(this.action);
}

class RemovePinnedActionEvent extends MainEvent {
  final AccountingAction action;

  RemovePinnedActionEvent(this.action);
}

class OnClickOnTableRowData extends MainEvent {
  final ITableRowData? tableRowData;

  OnClickOnTableRowData(this.tableRowData);
}

class OnCreateCounterparty extends MainEvent {
  final Counterparty counterparty;

  OnCreateCounterparty(this.counterparty);
}

class MainCreateDocumentMaster extends MainEvent {
  final CreateDocumentMasterBodyDto documentMasterBodyDto;

  MainCreateDocumentMaster(this.documentMasterBodyDto);
}

class OnUpdateCounterparty extends MainEvent {
  final Counterparty counterparty;

  OnUpdateCounterparty(this.counterparty);
}

class OnDeleteCounterparty extends MainEvent {
  final Counterparty counterparty;

  OnDeleteCounterparty(this.counterparty);
}

class FetchBaseData extends MainEvent {

  FetchBaseData();
}

class MainFetchAccountHaveTafziliGroup extends MainEvent {
  MainFetchAccountHaveTafziliGroup();
}

class MainFetchTafziliGroupAndChildListWithAccountId extends MainEvent {
  final int accountId;

  MainFetchTafziliGroupAndChildListWithAccountId({required this.accountId});
}

class OnLoadAvailableBankModalData extends MainEvent {}

class OnLoadRevolvingFundTypes extends MainEvent {
  OnLoadRevolvingFundTypes();
}

class OnLoadCompanyTypes extends MainEvent {
  OnLoadCompanyTypes();
}

class OnCreateStandardDetail extends MainEvent {
  StandardDetail standardDetail;

  OnCreateStandardDetail(this.standardDetail);
}

class OnUpdateStandardDetail extends MainEvent {
  StandardDetail standardDetail;

  OnUpdateStandardDetail(this.standardDetail);
}

class OnLoadCityList extends MainEvent {
  OnLoadCityList();
}

class OnLoadCustomerDetailList extends MainEvent {
  CustomerDataDetailParam customerDataDetailParam;

  OnLoadCustomerDetailList(this.customerDataDetailParam);
}

class OnCreateCustomerDetail extends MainEvent {
  CounterpartyDetail counterpartyDetail;

  OnCreateCustomerDetail(this.counterpartyDetail);
}

class OnUpdateCustomerDetail extends MainEvent {
  CounterpartyDetail counterpartyDetail;

  OnUpdateCustomerDetail(this.counterpartyDetail);
}

class OnDeleteCustomerDetail extends MainEvent {
  CounterpartyDetail counterpartyDetail;

  OnDeleteCustomerDetail(this.counterpartyDetail);
}
