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
class RepFetchReportTTSh extends ReportEvent {
  final ReportTarazTafziliShenavarBody body;

  const RepFetchReportTTSh({required this.body});

  @override
  List<Object?> get props => [body];
}


class RepFetchReportTTG extends ReportEvent {
  final ReportTarazTafziliGroupBody body;

  const RepFetchReportTTG({required this.body});

  @override
  List<Object?> get props => [body];
}

class RepFetchReportTTShH extends ReportEvent {
  final ReportTarazTafziliShenavarHesabBody body;

  const RepFetchReportTTShH({required this.body});

  @override
  List<Object?> get props => [body];
}
class RepFetchReportTM extends ReportEvent {
  final ReportTarazMoghayeseyiBody body;

  const RepFetchReportTM({required this.body});

  @override
  List<Object?> get props => [body];
}