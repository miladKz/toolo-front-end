part of 'fiscal_year_bloc.dart';

abstract class FiscalYearState extends Equatable {
  const FiscalYearState();
}

class FiscalYearInitial extends FiscalYearState {
  @override
  List<Object> get props => [];
}

class FiscalYearSuccess extends FiscalYearState {
  final List<FiscalYear> fiscalYearResponse;

  const FiscalYearSuccess({required this.fiscalYearResponse});

  @override
  List<Object> get props => [fiscalYearResponse];
}

class FiscalYearFinishWork extends FiscalYearState {
  @override
  List<Object> get props => [];
}

class FiscalYearLoadingOnView extends FiscalYearState {
  final bool isShow;

  const FiscalYearLoadingOnView({required this.isShow});

  @override
  // TODO: implement props
  List<Object?> get props => [isShow];
}
