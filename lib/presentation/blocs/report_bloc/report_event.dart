part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class RepInitial extends ReportEvent {
  @override
  List<Object?> get props => [];
}

class RepFetchReportTDP extends ReportEvent {
  final BalanceAndLedgersBody body;

  const RepFetchReportTDP({required this.body});

  @override
  List<Object?> get props => [body];
}

class RepFetchReportJT extends ReportEvent {
  final ReportJameTarazBody body;

  const RepFetchReportJT({required this.body});

  @override
  List<Object?> get props => [body];
}

class RepFetchReportTTSH extends ReportEvent {
  final ReportTarazTafziliShenavarBody body;

  const RepFetchReportTTSH({required this.body});

  @override
  List<Object?> get props => [body];
}