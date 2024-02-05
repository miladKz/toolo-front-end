import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fiscal_year_event.dart';
part 'fiscal_year_state.dart';

class FiscalYearBloc extends Bloc<FiscalYearEvent, FiscalYearState> {
  FiscalYearBloc() : super(FiscalYearInitial()) {
    on<FiscalYearEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
