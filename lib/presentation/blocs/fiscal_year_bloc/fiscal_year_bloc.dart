import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/domain/entities/fiscal/params/set_current_fiscal_year_param.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/get_fiscal_year_use_case.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/set_current_fiscal_year_use_case.dart';

import '../../../di/di.dart';
import '../../../domain/entities/fiscal/fiscal_year.dart';

part 'fiscal_year_event.dart';

part 'fiscal_year_state.dart';

class FiscalYearBloc extends Bloc<FiscalYearEvent, FiscalYearState> {
  late List<FiscalYear> fiscalYears;
  late TextEditingController _fiscalYearController;
  FiscalYear? selectedValueFiscalYear;

  FiscalYearBloc() : super(FiscalYearInitial()) {
    on<FiscalYearGetData>(_fiscalYearGetData);
    on<FiscalYearSetData>(_fiscalYearSetData);
  }

  bool get isInputDataValid {
    return selectedValueFiscalYear != null;
  }

  FutureOr<void> _fiscalYearGetData(
      FiscalYearGetData event, Emitter<FiscalYearState> emit) async {
    _fiscalYearController = TextEditingController(text: '');

    try {
      GetFiscalYearsUseCase useCase = locator<GetFiscalYearsUseCase>();
      fiscalYears = await useCase();
      emit(FiscalYearSuccess(fiscalYearResponse: fiscalYears));
    } on DioException catch (e) {
      e.toString();
    }
  }


  TextEditingController get fiscalYearController => _fiscalYearController;

  FutureOr<void> _fiscalYearSetData(
      FiscalYearSetData event, Emitter<FiscalYearState> emit) async {
    try {
      emit(const FiscalYearLoadingOnView(isShow: true));

      SetCurrentFiscalYearUseCase useCase =
          locator<SetCurrentFiscalYearUseCase>();

      SetCurrentFiscalYearParam param = SetCurrentFiscalYearParam(
          activeYearId: event.activeYearId, databaseId: event.databaseId);

      int result = await useCase(param);

      if (result > 0) {
        emit(FiscalYearFinishWork());
      } else {
        emit(const FiscalYearLoadingOnView(isShow: false));
      }
    } on DioException catch (e) {
      e.toString();
      emit(const FiscalYearLoadingOnView(isShow: false));
    }
  }
}
