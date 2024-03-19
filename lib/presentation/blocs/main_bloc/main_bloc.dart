import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/auth/user_data.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_accounting_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/update_account_use_case.dart';

import '../../../app_exception.dart';
import '../../../di/di.dart';
import '../../../domain/entities/accounting/account.dart';
import '../../../domain/entities/accounting/accounting_action.dart';
import '../../../domain/usecases/accounting/delete_account_use_case.dart';
import '../../../domain/usecases/auth/get_user_data_usecase.dart';
import '../../widgets/main/workspace_menu.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  List<AccountingAction> actions = List.empty(growable: true);
  Account? selectedAccount;

  MainBloc() : super(MainInitial()) {
    on<MainActionList>(_mainActionList);
    on<MainAccountList>(_mainAccountList);
    on<MainAnotherList>(_mainAnotherList);
    on<FilterActionsEvent>(_filterActionsHandler);
    on<OnClickOnAccount>(_showDetailAccountInFormHandler);
    on<OnUpdateAccount>(_updateAccountHandler);
    on<LoadUserData>(_getUserData);
    on<DeleteAccountEvent>(_deleteAccountHandler);
    on<AddPinnedActionEvent>(_addPinnedActionHandler);
    on<RemovePinnedActionEvent>(_removePinnedActionHandler);
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
      final filteredItems = _filterActions(WorkSpaceItems.accounting);
      emit(AccountingActionsSuccess(filteredItems));
   /*  await Future.delayed(Duration.zero).then((value) =>
          emit(AccountingActionsSuccess(filteredItems)));
      await Future.delayed(Duration.zero).then((value) =>
          emit(MainAccountSuccess(List.empty())));
      await  Future.delayed(Duration.zero).then((value) =>
          MainAccountDetailInFormVisibility(isShow: false));
      await  Future.delayed(Duration.zero).then((value) =>
          MainActionToolbarVisibility(isShow: false));*/
    } catch (e) {
    e.toString();
    }
  }

  FutureOr<void> _filterActionsHandler(
      FilterActionsEvent event, Emitter<MainState> emit) async {
    if (actions.isNotEmpty) {
      final filteredItems = _filterActions(event.selectedItem);
      emit(AccountingActionsSuccess(filteredItems));
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
    emit(MainLoadingOnView(isShow: true));
    GetAccountListUseCase useCase = locator<GetAccountListUseCase>();
    List<Account> accountList = await useCase();
    emit(MainLoadingOnView(isShow: false));
    emit(MainAccountSuccess(accountList));
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
    if (event.endpoint.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 50));
      emit(MainAccountSuccess(List.empty()));
      await Future.delayed(const Duration(milliseconds: 20));
      emit(MainAccountDetailInFormVisibility(isShow: false));
      await Future.delayed(const Duration(milliseconds: 20));
      emit(MainActionToolbarVisibility(isShow: false));
    }
  }

  FutureOr<void> _showDetailAccountInFormHandler(OnClickOnAccount event,
      Emitter<MainState> emit) async {
    selectedAccount = event.account;
    emit(MainAccountDetailInFormVisibility(
        account: event.account, isShow: true));
    await Future.delayed(Duration.zero);
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
    selectedAccount = null;
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

  void reGetAccounts() async{
   await Future.delayed(const Duration(milliseconds: 200));
    add(MainAccountList());
  }

  void resetAccountList() async{
    await Future.delayed(const Duration(milliseconds: 200));
    add(MainAnotherList(endpoint: ""));
  }
}
