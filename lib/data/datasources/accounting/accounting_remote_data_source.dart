import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:toolo_gostar/data/common/mixin/http_response_validator.dart';
import 'package:toolo_gostar/data/common/models/server_response_dto.dart';
import 'package:toolo_gostar/data/enum/counter_party_kinds.dart';
import 'package:toolo_gostar/data/models/accounting/account_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/customer_data_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/param/standard_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/base_dto/standard_detail_dto.dart';
import 'package:toolo_gostar/data/models/accounting/counterparty_dto.dart';

import '../../../domain/entities/base/param/customer_data_detail_param.dart';
import '../../models/accounting/counterparty_detail_dto.dart';

class AccountingRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  late String baseUrl = "http://46.249.101.180:8090";
  final jsonContentType = 'application/json;charset=utf-8';
  final soapContentType = 'application/soap+xml;charset=utf-8';

  AccountingRemoteDataSource({required this.httpClient});

  Future<ServerResponseDto> getActionList({required String token}) async {
    String apiAddress = "/api/pub/actions-list/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> updateAccount(
      {required String token, required AccountDto param}) async {
    String apiAddress = "/api/acc/accounts";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.put(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log('updateAccount msg: ${response.data}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('updateAccount msg: $e}');
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> createAccount(
      {required String token, required AccountDto param}) async {
    String apiAddress = "/api/acc/accounts";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.post(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> deleteAccount(
      {required String token, required AccountDto param}) async {
    String apiAddress = "/api/acc/accounts/${param.id}";
    try {
      Response<dynamic> response = await httpClient.delete(
        apiAddress,
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> getAccountList({required String token}) async {
    String apiAddress = "/api/acc/accounts/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> getDetailAccountList(
      {required String token}) async {
    String apiAddress = "/api/acc/tafzili/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Options _getHeaders(String token) {
    return Options(headers: {
      "Authorization": "Bearer $token",
      'content-type': jsonContentType,
    }, contentType: jsonContentType);
  }

  Map<String, dynamic> getData(Response response) {
    return jsonDecode(response.data);
  }

  Future<ServerResponseDto> getCounterPartyList(
      {required String token, required CounterPartyKinds kind}) async {
    String apiAddress = "/api/acc/moshtarian/list?kind=${kind.value}";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> createCounterParty(
      {required String token, required CounterpartyDto param}) async {
    String apiAddress = "/api/acc/moshtarian";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.post(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> updateCounterparty(
      {required String token, required CounterpartyDto param}) async {
    String apiAddress = "/api/acc/moshtarian";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.put(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log('updateCounterparty msg: ${response.data}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('updateCounterparty msg: $e}');
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> deleteCounterparty(
      {required String token, required CounterpartyDto param}) async {
    String apiAddress = "/api/acc/moshtarian/${param.id}";
    try {
      Response<dynamic> response = await httpClient.delete(
        apiAddress,
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchDetailGroupRootList({
    required String token,
  }) async {
    String apiAddress = "/api/acc/tafzili-group/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  ///get Neshani And SayerMoshakhasat List
  Future<ServerResponseDto> fetchCustomerDataDetailList(
      {required String token,
      required CustomerDataDetailParamDto param}) async {
    String apiAddress = "/api/acc/moshtarian-detail/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  //______________________________________Base Api____________________________________

  Future<ServerResponseDto> fetchBankAccTypeList({
    required String token,
  }) async {
    String apiAddress = "/api/base/bank-acc-type/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchBankAccTypeList :${getData(response)}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchBourseTypeList({
    required String token,
  }) async {
    String apiAddress = "/api/base/boors-type/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchBourseTypeList :${getData(response)}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchCurrencyTypeList({
    required String token,
  }) async {
    String apiAddress = "/api/base/arz-type/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchCurrencyTypeList :${getData(response)}');

      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchCustomerStatusList({
    required String token,
  }) async {
    String apiAddress = "/api/base/customer-status/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchCustomerStatusList :${getData(response)}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchDocumentTypeList({
    required String token,
  }) async {
    String apiAddress = "/api/base/barge-type/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchDocumentTypeList :${getData(response)}');

      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchPersonTypeList({
    required String token,
  }) async {
    String apiAddress = "/api/base/person-type/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchPersonTypeList :${getData(response)}');

      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchPrefixList({
    required String token,
  }) async {
    String apiAddress = "/api/base/prefix/list/0";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchPrefixList :${getData(response)}');

      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchStandardDetailList(
      {required String token, required StandardDetailParamDto param}) async {
    String apiAddress =
        "/api/base/standard-text/list?BargeTypeID=${param.bargeTypeID}&Section=${param.section}";
    debugPrint("${param.toMap()}");
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchStandardDetailList :${getData(response)}');

      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> fetchAvailableBankList({
    required String token,
  }) async {
    String apiAddress = "/api/base/bank/list";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('fetchBankList :${getData(response)}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> createStandardDetail(
      {required String token, required StandardDetailDto param}) async {
    String apiAddress = "/api/base/standard-text";
    try {
      Response<dynamic> response = await httpClient.post(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('create standardDetail msg: $e}');
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> updateStandardDetail(
      {required String token, required StandardDetailDto param}) async {
    String apiAddress = "/api/base/standard-text";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.put(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log('update standardDetail msg: ${response.data}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('update standardDetail msg: $e}');
      throw HttpException(e.toString());
    }
  }

  void log(Object logable) {
    debugPrint('fetchData--> ${logable.toString()}');
  }

  Future<ServerResponseDto> getCityList(
      {required String token, required String stateCode}) async {
    String apiAddress = "/api/base/city/list?StateCode=$stateCode";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> getCounterPartyDetailList(
      {required String token, required CustomerDataDetailParam param}) async {
    String apiAddress =
        "/api/base/bank/list?MoshtarianID=${param.customerId}&ValueType=${param.valueType}";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );
      log('getCounterPartyDetailList :${getData(response)}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> createCounterPartyDetail(
      {required String token, required CounterpartyDetailDto param}) async {
    String apiAddress = "/api/acc/moshtarian-detail";
    try {
      Response<dynamic> response = await httpClient.post(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('create CounterpartyDetail msg: $e}');
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> updateCounterpartyDetail(
      {required String token, required CounterpartyDetailDto param}) async {
    String apiAddress = "/api/acc/moshtarian-detail";
    try {
      log(param.toMap());
      Response<dynamic> response = await httpClient.put(
        apiAddress,
        data: param.toMap(),
        options: _getHeaders(token),
      );
      log('update CounterpartyDetail msg: ${response.data}');
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      log('update standardDetail msg: $e}');
      throw HttpException(e.toString());
    }
  }
}
