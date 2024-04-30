part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();
}

class ReportInitial extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoadingOnView extends ReportState {
  final bool isShow;

  const ReportLoadingOnView({required this.isShow});

  @override
  List<Object?> get props => [isShow];
}
