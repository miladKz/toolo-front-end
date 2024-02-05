import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fiscal_year_event.dart';
part 'fiscal_year_state.dart';

class FiscalYearBloc extends Bloc<FiscalYearEvent, FiscalYearState> {
  FiscalYearBloc() : super(FiscalYearInitial()) {
    on<FiscalYearEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
