part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class ReportGetData extends ReportEvent {
  final String token;

  const ReportGetData({required this.token});

  @override
  List<Object?> get props => [token];
}