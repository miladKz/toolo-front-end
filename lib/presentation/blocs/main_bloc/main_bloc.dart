import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_accounting_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';

import '../../../app_exception.dart';
import '../../../di/di.dart';
import '../../../domain/entities/accounting/account.dart';
import '../../../domain/entities/accounting/accounting_action.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<AccountingEvent>(_accountingEvent);
    on<MainAccountList>(_mainAccountList);

  }

  FutureOr<void> _accountingEvent(
      AccountingEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    GetActionsUseCase useCase = locator<GetActionsUseCase>();
    List<AccountingAction> actions = await useCase();
    emit(MainLoadingOnView(isShow: false));
    emit(AccountingActionsReceived(actions));
  }

  FutureOr<void> _mainAccountList(MainAccountList event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    GetAccountListUseCase useCase = locator<GetAccountListUseCase>();
    List<Account> accountList = await useCase();
    emit(MainLoadingOnView(isShow: false));
    emit(MainAccountReceived(accountList));
  }
}
