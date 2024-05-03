part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class RepInitial extends ReportEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class RepFetchRepostTDP extends ReportEvent {
  final BalanceAndLedgersParam body;

  const RepFetchRepostTDP({required this.body});


  @override
  List<Object?> get props => [bool];
}