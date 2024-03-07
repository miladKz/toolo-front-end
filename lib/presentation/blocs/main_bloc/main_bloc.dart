import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';

import '../../../app_exception.dart';
import '../../../di/di.dart';
import '../../../domain/entities/accounting/accounting_action.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<AccountingEvent>(_accontingEvent);
  }

  FutureOr<void> _accontingEvent(
      AccountingEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingOnView(isShow: true));
    GetActionsUseCase useCase = locator<GetActionsUseCase>();
    List<AccountingAction> actions = await useCase();
    emit(MainLoadingOnView(isShow: false));
    emit(AccountingActionsReceived(actions));
  }
}
