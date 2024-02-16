part of 'fiscal_year_bloc.dart';

abstract class FiscalYearEvent extends Equatable {
  const FiscalYearEvent();
}

class FiscalYearGetData extends FiscalYearEvent {
  final String token;

  const FiscalYearGetData({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}

class FiscalYearSetData extends FiscalYearEvent {
  final String token;
  final int activeYearId;

  const FiscalYearSetData({required this.token, required this.activeYearId});
  @override
  // TODO: implement props
  List<Object?> get props => [token, activeYearId];
}
