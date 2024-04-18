import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/data/enum/api_enum.dart';
import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/domain/entities/accounting/detail_group.dart';
import 'package:toolo_gostar/domain/entities/auth/user_data.dart';
import 'package:toolo_gostar/domain/entities/base/bank_acc_type.dart';
import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/entities/base/currency_type.dart';
import 'package:toolo_gostar/domain/entities/base/customer_data_detail.dart';
import 'package:toolo_gostar/domain/entities/base/customer_status.dart';
import 'package:toolo_gostar/domain/entities/base/detail_group_root.dart';
import 'package:toolo_gostar/domain/entities/base/document_type.dart';
import 'package:toolo_gostar/domain/entities/base/param/customer_data_detail_param.dart';
import 'package:toolo_gostar/domain/entities/base/person_type.dart';
import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/entities/base/standard_detail.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_available_bank_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_bank_acc_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_bourse_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_currency_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_customer_data_detail_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_customer_status_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_detail_group_root_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_document_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_person_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_prefix_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_standard_detail_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/delete_counter_party_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_accounting_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_bank_list.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_card_reader_list.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_people_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_revolving_found_list.dart';
import 'package:toolo_gostar/domain/usecases/accounting/update_account_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/update_counter_party_use_case.dart';
import 'package:toolo_gostar/presentation/view_models/base_data_model.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

import '../../../app_exception.dart';
import '../../../di/di.dart';
import '../../../domain/entities/accounting/account.dart';
import '../../../domain/entities/accounting/accounting_action.dart';
import '../../../domain/entities/base/available_bank_.dart';
import '../../../domain/entities/common/abstracts/table_row_data_abs.dart';
import '../../../domain/entities/common/counterparty.dart';
import '../../../domain/usecases/accounting/create_counter_party_use_case.dart';
import '../../../domain/usecases/accounting/delete_account_use_case.dart';
import '../../../domain/usecases/accounting/get_detail_account_group_list_use_case.dart';
import '../../../domain/usecases/auth/get_user_data_usecase.dart';
import '../../widgets/main/workspace_menu.dart';

part 'main_event.dart';
part 'main_state.dart';

List<Account> accountItems = List.empty(growable: true);
late BaseDataModel baseDataModel;

class MainBloc extends Bloc<MainEvent, MainState> {
  List<AccountingAction> actions = [];
  List<AccountingAction> filteredActions = [];
  IDataTreeModel? selectedDataTreeItem;

  List<DetailGroup> detailAccountGroup = [];

  List<Counterparty> counterpartyList = [];

  ITableRowData? selectedCounterparty;

  MainBloc() : super(MainInitial()) {
    on<MainActionList>(_mainActionList);
    on<MainAccountList>(_mainAccountList);
    on<MainAnotherList>(_mainAnotherList);
    on<FilterActionsEvent>(_filterActionsHandler);
    on<OnClickOnAccount>(_showDetailAccountInFormHandler);
    on<OnClickOnTableRowData>(_setSelectedTableRowItem);
    on<OnUpdateAccount>(_updateAccountHandler);
    on<LoadUserData>(_getUserData);
    on<DeleteAccountEvent>(_deleteAccountHandler);
    on<AddPinnedActionEvent>(_addPinnedActionHandler);
    on<RemovePinnedActionEvent>(_removePinnedActionHandler);
    on<OnCreateCounterparty>(_createCounterpartyHandler);
    on<OnUpdateCounterparty>(_updateCounterpartyHandler);
    on<OnDeleteCounterparty>(_deleteCounterpartyHandler);
    on<FetchBaseData>(_fetchBaseData);
    on<OnLoadAvailableBankModalData>(_onLoadAvailableBankModalData);
  }

  FutureOr<void> _mainActionList(
      MainActionList event, Emitter<MainState> emit) async {
    try {
      debugPrint('Atras method _mainActionList: ');
      emit(MainLoadingOnView(isShow: false));
      GetActionsUseCase useCase = locator<GetActionsUseCase>();
      debugPrint('Atras method _mainActionList useCase: $useCase');
      actions = await useCase();
      emit(MainLoadingOnView(isShow: false));
      filteredActions = _filterActions(WorkSpaceItems.accounting);
      emit(AccountingActionsSuccess(filteredActions));
      await Future.delayed(const Duration(milliseconds: 200));
      add(FetchBaseData());
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _filterActionsHandler(
      FilterActionsEvent event, Emitter<MainState> emit) async {
    if (actions.isNotEmpty) {
      filteredActions = _filterActions(event.selectedItem);
      emit(AccountingActionsSuccess(filteredActions));
      resetAccountList();
    }
  }

  _filterActions(WorkSpaceItems selectedItem) {
    return actions
        .where((item) => item.description == getFilteredKey(selectedItem))
        .toList();
  }

  FutureOr<void> _mainAccountList(
      MainAccountList event, Emitter<MainState> emit) async {
    emit(ApiChange(apiEnum: ApiEnum.unknown));
    emit(MainLoadingOnView(isShow: true));
    GetAccountListUseCase useCase = locator<GetAccountListUseCase>();
    List<Account> accountList = await useCase();
    emit(ApiChange(apiEnum: ApiEnum.accountList));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(MainLoadingOnView(isShow: false));
    await Future.delayed(const Duration(milliseconds: 20));
    emit(MainAccountSuccess(accountList));
    accountItems = accountList;
  }

  String getFilteredKey(WorkSpaceItems selectedItem) {
    String arrayKey = '';
    switch (selectedItem) {
      case WorkSpaceItems.accounting:
        arrayKey = "حسابداری مالی-مالیاتی";
        break;
      case WorkSpaceItems.suppliersAndProcurement:
        arrayKey = "تامین کنندگان و خرید";
        break;
      case WorkSpaceItems.customersAndSales:
        arrayKey = "مشتریان و فروش";
        break;
      case WorkSpaceItems.tax:
        arrayKey = "مالیات";
        break;
      case WorkSpaceItems.inventoryAndAccounting:
        arrayKey = "انبار و حسابداری انبار";
        break;
      case WorkSpaceItems.receivablesAndPayables:
        arrayKey = "دریافت و پرداخت";
        break;
    }
    return arrayKey;
  }

  FutureOr<void> _mainAnotherList(
      MainAnotherList event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    if (event.apiEnum == ApiEnum.managementRelationShipAccount) {
      GetDetailAccountGroupListUseCase useCase =
          locator<GetDetailAccountGroupListUseCase>();
      detailAccountGroup = await useCase();
    } else if (event.apiEnum == ApiEnum.managementPeople) {
      GetPeopleListUseCase useCase = locator<GetPeopleListUseCase>();
      counterpartyList = await useCase();
    } else if (event.apiEnum == ApiEnum.managementBankBranch) {
      GetBankListUseCase useCase = locator<GetBankListUseCase>();
      counterpartyList = await useCase();
    } else if (event.apiEnum == ApiEnum.managementCardReader) {
      GetCardReaderListUseCase useCase = locator<GetCardReaderListUseCase>();
      counterpartyList = await useCase();
    } else if (event.apiEnum == ApiEnum.managementRevolvingFund) {
      GetRevolvingFundListUseCase useCase =
          locator<GetRevolvingFundListUseCase>();
      counterpartyList = await useCase();
    }
    emit(ApiChange(apiEnum: ApiEnum.unknown));
    await Future.delayed(const Duration(milliseconds: 10));
    emit(ApiChange(apiEnum: event.apiEnum));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(MainLoadingOnView(isShow: false));
  }

  FutureOr<void> _showDetailAccountInFormHandler(
      OnClickOnAccount event, Emitter<MainState> emit) async {
    selectedDataTreeItem = event.account;
    emit(MainAccountDetailInFormVisibility(
        account: event.account, isShow: true));
    await Future.delayed(const Duration(milliseconds: 20));
    emit(MainActionToolbarVisibility(isShow: true));
  }

  FutureOr<void> _updateAccountHandler(
      OnUpdateAccount event, Emitter<MainState> emit) async {
    try {
      emit(MainLoadingOnButton(isShow: true));
      UpdateAccountUseCase useCase = locator<UpdateAccountUseCase>();
      Account account = await useCase(event.account);
      emit(MainLoadingOnButton(isShow: false));
      emit(MainUpdatedAccountSuccess(account));
      reGetAccounts();
    } catch (e) {
      emit(MainUpdatedAccountFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _getUserData(LoadUserData event, Emitter<MainState> emit) {
    GetUserDataUseCase useCase = locator<GetUserDataUseCase>();
    UserData userData = useCase();
    emit(MainLoadUserDataSuccess(userData));
  }

  FutureOr<void> _deleteAccountHandler(
      DeleteAccountEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    DeleteAccountUseCase useCase = locator<DeleteAccountUseCase>();
    String message = await useCase(event.account);
    emit(MainLoadingOnView(isShow: false));
    selectedDataTreeItem = null;
    emit(MainDeletedAccountSuccess(message));
    reGetAccounts();
  }

  FutureOr<void> _addPinnedActionHandler(
      AddPinnedActionEvent event, Emitter<MainState> emit) {
    emit(MainAddPinnedActionSuccess(event.action));
  }

  FutureOr<void> _removePinnedActionHandler(
      RemovePinnedActionEvent event, Emitter<MainState> emit) {
    emit(MainRemovePinnedActionSuccess(event.action));
  }

  void reGetAccounts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    add(MainAccountList());
  }

  void resetAccountList() async {
    await Future.delayed(const Duration(milliseconds: 200));
    add(MainAnotherList(endpoint: "", apiEnum: ApiEnum.unknown));
  }

  T? getSelectedDataTreeItem<T>() {
    if (selectedDataTreeItem.runtimeType is T) {
      return (selectedDataTreeItem as T);
    }
    return null;
  }

  T? getSelectedCounterparty<T>() {
    try {
      return (selectedCounterparty as T);
    } catch (e) {
      return null;
    }
  }

  FutureOr<void> _setSelectedTableRowItem(
      OnClickOnTableRowData event, Emitter<MainState> emit) {
    selectedCounterparty = event.tableRowData;
  }

  FutureOr<void> _createCounterpartyHandler(
      OnCreateCounterparty event, Emitter<MainState> emit) async {
    try {
      emit(MainLoadingOnButton(isShow: true));
      CreateCounterpartyUseCase useCase = locator<CreateCounterpartyUseCase>();
      Counterparty counterparty = await useCase(event.counterparty);
      emit(MainLoadingOnButton(isShow: false));
      emit(SuccessCreateCounterparty(counterparty));
      reGetCounterParty(counterparty);
    } catch (e) {
      emit(FailedUpdateCounterparty(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updateCounterpartyHandler(
      OnUpdateCounterparty event, Emitter<MainState> emit) async {
    try {
      emit(MainLoadingOnButton(isShow: true));
      UpdateCounterpartyUseCase useCase = locator<UpdateCounterpartyUseCase>();
      Counterparty counterparty = await useCase(event.counterparty);
      emit(MainLoadingOnButton(isShow: false));
      emit(SuccessUpdateCounterparty(counterparty));
      reGetCounterParty(counterparty);
    } catch (e) {
      emit(FailedUpdateCounterparty(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _deleteCounterpartyHandler(
      OnDeleteCounterparty event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    DeleteCounterpartyUseCase useCase = locator<DeleteCounterpartyUseCase>();
    String message = await useCase(event.counterparty);
    emit(MainLoadingOnView(isShow: false));
    selectedCounterparty = null;
    emit(SuccessDeletedCounterparty(message));
    reGetCounterParty(event.counterparty);
  }

  void reGetCounterParty(Counterparty counterparty) async {
    await Future.delayed(const Duration(milliseconds: 200));
    add(MainAnotherList(
        endpoint: "",
        apiEnum: getCorrectApiFromCounterpartyKind(counterparty)));
  }

  ApiEnum getCorrectApiFromCounterpartyKind(Counterparty counterparty) {
    CounterPartyKinds kind = CounterPartyKinds.fromValue(counterparty.kind);
    ApiEnum apiEnum;
    switch (kind) {
      case CounterPartyKinds.people:
        apiEnum = ApiEnum.managementPeople;
        break;
      case CounterPartyKinds.bank:
        apiEnum = ApiEnum.managementBankBranch;
        break;
      case CounterPartyKinds.cardReader:
        apiEnum = ApiEnum.managementCardReader;
        break;
      case CounterPartyKinds.revolvingFund:
        apiEnum = ApiEnum.managementRevolvingFund;
        break;
      case CounterPartyKinds.cashBox:
        apiEnum = ApiEnum.unknown;
        break;
    }
    return apiEnum;
  }

  FutureOr<void> _fetchBaseData(
      FetchBaseData event, Emitter<MainState> emit) async {
    List<BankAccType> bankAccTypeList = await fetchBankAccTypeList();
    List<BourseType> bourseTypeList = await fetchBourseTypeList();
    List<CurrencyType> currencyTypeList = await fetchCurrencyTypeList();
    List<DetailGroupRoot> detailGroupRootList =
        await fetchDetailGroupRootList();
    List<DocumentType> documentTypeList = await fetchDocumentTypeList();
    List<PersonType> personTypeList = await fetchPersonTypeList();
    List<Prefix> prefixList = await fetchPrefixList();
    List<CustomerStatus> customerStatusList = await fetchCustomerStatusList();
    List<Counterparty> counterpartyBankList = await fetchCounterpartyBankList();

    baseDataModel = BaseDataModel(
        bankAccTypeList: bankAccTypeList,
        bourseTypeList: bourseTypeList,
        currencyTypeList: currencyTypeList,
        customerStatusList: customerStatusList,
        detailGroupRootList: detailGroupRootList,
        documentTypeList: documentTypeList,
        personTypeList: personTypeList,
        prefixList: prefixList,
        counterpartyBankList: counterpartyBankList);

    debugPrint(baseDataModel.toString());
  }

  Future<List<BankAccType>> fetchBankAccTypeList() async {
    FetchBankAccTypeListUseCase useCaseFetchBankAccTypeList =
        locator<FetchBankAccTypeListUseCase>();
    return await useCaseFetchBankAccTypeList();
  }

  Future<List<BourseType>> fetchBourseTypeList() async {
    FetchBourseTypeListUseCase useCaseFetchBourseTypeList =
        locator<FetchBourseTypeListUseCase>();
    return await useCaseFetchBourseTypeList();
  }

  Future<List<CurrencyType>> fetchCurrencyTypeList() async {
    FetchCurrencyTypeListUseCase useCaseFetchCurrencyTypeList =
        locator<FetchCurrencyTypeListUseCase>();
    return await useCaseFetchCurrencyTypeList();
  }

  Future<List<DetailGroupRoot>> fetchDetailGroupRootList() async {
    FetchDetailGroupRootListUseCase useCaseFetchDetailGroupRootList =
        locator<FetchDetailGroupRootListUseCase>();
    return await useCaseFetchDetailGroupRootList();
  }

  Future<List<DocumentType>> fetchDocumentTypeList() async {
    FetchDocumentTypeListUseCase useCaseFetchDocumentTypeList =
        locator<FetchDocumentTypeListUseCase>();
    return await useCaseFetchDocumentTypeList();
  }

  Future<List<PersonType>> fetchPersonTypeList() async {
    FetchPersonTypeListUseCase useCaseFetchPersonTypeList =
        locator<FetchPersonTypeListUseCase>();
    return await useCaseFetchPersonTypeList();
  }

  Future<List<Prefix>> fetchPrefixList() async {
    FetchPrefixListUseCase useCaseFetchPrefixList =
        locator<FetchPrefixListUseCase>();
    return await useCaseFetchPrefixList();
  }

  Future<List<CustomerStatus>> fetchCustomerStatusList() async {
    FetchCustomerStatusListUseCase useCaseFetchCustomerStatusList =
        locator<FetchCustomerStatusListUseCase>();
    return await useCaseFetchCustomerStatusList();
  }

  Future<List<Counterparty>> fetchCounterpartyBankList() async {
    GetBankListUseCase useCaseFetchCounterpartyBankList =
        locator<GetBankListUseCase>();
    return await useCaseFetchCounterpartyBankList();
  }

  Future<List<CustomerDataDetail>> fetchCustomerDataDetailList(
      {required CustomerDataDetailParam param}) async {
    FetchCustomerDataDetailListUseCase useCaseFetchCustomerDataDetailList =
        locator<FetchCustomerDataDetailListUseCase>();
    return await useCaseFetchCustomerDataDetailList(param: param);
  }

  Future<List<StandardDetail>> fetchStandardDetailList(
      {required StandardDetailParamDto standardDetailParamDto}) async {
    FetchStandardDetailListUseCase useCaseFetchStandardDetailList =
        locator<FetchStandardDetailListUseCase>();
    return await useCaseFetchStandardDetailList(
        standardDetailParamDto: standardDetailParamDto);
  }

  FutureOr<void> _onLoadAvailableBankModalData(
      OnLoadAvailableBankModalData event, Emitter<MainState> emit) async {
    FetchAvailableBankListUseCase availableBankListUseCase =
        locator<FetchAvailableBankListUseCase>();
    emit(LoadingAvailableBankModalData(isShow: true));
    List<AvailableBank> availableBankList = await availableBankListUseCase();
    emit(LoadedAvailableBankModalData(availableBankList: availableBankList));
  }
}
