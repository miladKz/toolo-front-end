import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/balance_and_ledgers_report.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/params/balance_and_ledgers_param.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_balance_and_ledgers_report_list_usecases.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState>  {
  ReportBloc() : super(ReportInitial()) {
    on<RepFetchRepostTDP>(_fetchRepostTDP);
  }

  FutureOr<void> _fetchRepostTDP(
      RepFetchRepostTDP event, Emitter<ReportState> emit) async {
    FetchBalanceAndLedgersReportListUseCase useCase =
        locator<FetchBalanceAndLedgersReportListUseCase>();
    BalanceAndLedgersReport model=  await useCase(body: event.body);

    emit(ReportSuccessTDP(model: model));
  }
}
