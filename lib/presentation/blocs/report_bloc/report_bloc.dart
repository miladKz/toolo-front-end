import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/balance_and_ledgers_report.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/balance_and_ledgers_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_jame_taraz_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_group_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shebavar_hesab_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shenavar_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_group.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar_hesab.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_balance_and_ledgers_report_list_usecases.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_report_jame_taraz_list_usecases.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_report_taraz_tafzili_group_list_usecases.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_report_taraz_tafzili_shenavar_hesab_list_usecases.dart';
import 'package:toolo_gostar/domain/usecases/accounting/report/fetch_report_taraz_tafzili_shenavar_list_usecases.dart';

part 'report_event.dart';

part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState>  {
  ReportBloc() : super(ReportInitial()) {
    on<RepFetchReportTDP>(_fetchRepostTDP);
    on<RepFetchReportJT>(_fetchReportJT);
    on<RepFetchReportTTSh>(_fetchReportTTSh);
    on<RepFetchReportTTShH>(_fetchReportTTShH);
    on<RepFetchReportTTG>(_fetchReportTTG);
  }

  FutureOr<void> _fetchRepostTDP(RepFetchReportTDP event,
      Emitter<ReportState> emit) async {
    FetchBalanceAndLedgersReportListUseCase useCase =
        locator<FetchBalanceAndLedgersReportListUseCase>();
    BalanceAndLedgersReport model=  await useCase(body: event.body);

    emit(ReportSuccessTDP(model: model));
  }

  FutureOr<void> _fetchReportJT(
      RepFetchReportJT event, Emitter<ReportState> emit) async {
    FetchReportJameTarazListUseCase useCase =
        locator<FetchReportJameTarazListUseCase>();
    ReportJameTaraz model = await useCase(body: event.body);

    emit(ReportSuccessJT(model: model));
  }

  FutureOr<void> _fetchReportTTSh(
      RepFetchReportTTSh event, Emitter<ReportState> emit) async {
    FetchReportTarazTafziliShenavarListUseCase useCase =
        locator<FetchReportTarazTafziliShenavarListUseCase>();
    ReportTarazTafziliShenavar model = await useCase(body: event.body);

    emit(ReportSuccessTTSh(model: model));
  }

  FutureOr<void> _fetchReportTTG(
      RepFetchReportTTG event, Emitter<ReportState> emit) async {
    FetchReportTarazTafziliGroupListUseCase useCase =
        locator<FetchReportTarazTafziliGroupListUseCase>();
    ReportTarazTafziliGroup model = await useCase(body: event.body);

    emit(ReportSuccessTTG(model: model));
  }

  FutureOr<void> _fetchReportTTShH(
      RepFetchReportTTShH event, Emitter<ReportState> emit) async {
    FetchReportTarazTafziliShenavarHesabListUseCase useCase =
        locator<FetchReportTarazTafziliShenavarHesabListUseCase>();
    ReportTarazTafziliShenavarHesab model = await useCase(body: event.body);

    emit(ReportSuccessTTShH(model: model));
  }
}
