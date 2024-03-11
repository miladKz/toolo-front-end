part of 'fiscal_year_bloc.dart';

abstract class FiscalYearEvent extends Equatable {
  const FiscalYearEvent();
}

class FiscalYearGetData extends FiscalYearEvent {
  final String token;

  const FiscalYearGetData({required this.token});

  @override
  List<Object?> get props => [token];
}

class FiscalYearSetData extends FiscalYearEvent {
  final int activeYearId;
  final int databaseId;

  const FiscalYearSetData(
      {required this.activeYearId, required this.databaseId});

  @override
  List<Object?> get props => [activeYearId, databaseId];
}
