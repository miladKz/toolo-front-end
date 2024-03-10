import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_accounting_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';

import '../../../app_exception.dart';
import '../../../di/di.dart';
import '../../../domain/entities/accounting/account.dart';
import '../../../domain/entities/accounting/accounting_action.dart';
import '../../widgets/main/workspace_menu.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  List<AccountingAction> actions = [];

  MainBloc() : super(MainInitial()) {
    on<AccountingEvent>(_accountingEvent);
    on<MainAccountList>(_mainAccountList);
    on<FilterActionsEvent>(_filterActionsHandler);
  }

  FutureOr<void> _accountingEvent(
      AccountingEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    GetActionsUseCase useCase = locator<GetActionsUseCase>();
    actions = await useCase();
    emit(MainLoadingOnView(isShow: false));
    final filteredItems = _filterActions(WorkSpaceItems.accounting);
    emit(AccountingActionsReceived(filteredItems));
  }

  FutureOr<void> _filterActionsHandler(
      FilterActionsEvent event, Emitter<MainState> emit) async {
    if (actions.isNotEmpty) {
      final filteredItems = _filterActions(event.selectedItem);
      emit(AccountingActionsReceived(filteredItems));
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
    emit(MainAccountReceived(accountList));
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
}
