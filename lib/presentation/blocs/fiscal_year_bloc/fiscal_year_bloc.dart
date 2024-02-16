import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';
import 'package:toolo_gostar/data/models/fiscal_year/fiscal_year_data.dart';
import 'package:toolo_gostar/data/models/fiscal_year/fiscal_year_response.dart';
import 'package:toolo_gostar/data/models/fiscal_year/work_group_data.dart';

part 'fiscal_year_event.dart';

part 'fiscal_year_state.dart';

class FiscalYearBloc extends Bloc<FiscalYearEvent, FiscalYearState> {
  late FiscalYearResponse fiscalYearResponse;
  late TextEditingController _fiscalYearController;
  late TextEditingController _workGroupController;
  FiscalYearData? selectedValueFiscalYear;
  WorkGroupData? selectedValueWorkGroup;

  FiscalYearBloc() : super(FiscalYearInitial()) {
    on<FiscalYearGetData>(_fiscalYearGetData);
    on<FiscalYearSetData>(_fiscalYearSetData);
  }

  bool get isInputDataValid {
    return selectedValueFiscalYear != null && selectedValueWorkGroup != null;
  }

  FutureOr<void> _fiscalYearGetData(
      FiscalYearGetData event, Emitter<FiscalYearState> emit) async {
    _fiscalYearController = TextEditingController(text: '');
    _workGroupController = TextEditingController(text: '');
    //httpClient.options.headers["Authorization"] = "Bearer ${event.token}";
    try {
      Response<dynamic> response = await httpClient.get(
        "/api/user/accessible-data",
        options: Options(headers: {
          "Authorization": "Bearer ${event.token}",
          'content-type': jsonContentType,
        }, contentType: jsonContentType),
      );
      fiscalYearResponse =
          FiscalYearResponse.fromJson(json: jsonDecode(response.data));
      emit(FiscalYearSuccess(fiscalYearResponse: fiscalYearResponse));
    } on DioException catch (e) {
      e.toString();
    }
  }

  TextEditingController get fiscalYearController => _fiscalYearController;

  TextEditingController get workGroupController => _workGroupController;

  FutureOr<void> _fiscalYearSetData(
      FiscalYearSetData event, Emitter<FiscalYearState> emit) async {
    try {
      emit(const FiscalYearLoadingOnView(isShow: true));
      final Map<String, dynamic> param = {
        "active_year_id": event.activeYearId,
      };
      Response<dynamic> response = await httpClient.post(
        "/api/user/set-current-db",
        queryParameters: param,
        options: Options(headers: {
          "Authorization": "Bearer ${event.token}",
          'content-type': jsonContentType,
        }, contentType: jsonContentType),
      );
      if (response.statusCode == 200) {
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
