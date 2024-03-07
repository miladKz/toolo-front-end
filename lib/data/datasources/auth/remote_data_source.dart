import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:toolo_gostar/data/common/mixin/http_response_validator.dart';
import 'package:toolo_gostar/data/common/models/server_response_dto.dart';
import 'package:toolo_gostar/data/models/fiscal_year/params/set_current_fiscal_year_param_dto.dart';

import '../../models/auth/params/login_param_dto.dart';

class RemoteDataSource with HttpResponseValidator {
  final Dio httpClient;
  late String baseUrl = "http://46.249.101.180:8090";
  final jsonContentType = 'application/json;charset=utf-8';
  final soapContentType = 'application/soap+xml;charset=utf-8';

  RemoteDataSource({required this.httpClient});

  Future<ServerResponseDto> login({required LoginParamDto loginParam}) async {
    String apiAddress = "/api/pub/user/login";
    try {
      Response<dynamic> response = await httpClient.post(apiAddress,
          queryParameters: loginParam.toMap());
      return ServerResponseDto.fromMap(jsonDecode(response.data));
    } on DioException catch (e) {
      print(e);
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> getFiscalYearData({required String token}) async {
    String apiAddress = "/api/pub/user/accessible-year";
    try {
      Response<dynamic> response = await httpClient.get(
        apiAddress,
        options: _getHeaders(token),
      );

      return ServerResponseDto.fromMap(jsonDecode(response.data));
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> setCurrentFiscalYear(
      {required String token,
      required SetCurrentFiscalYearParamDto param}) async {
    String apiAddress = "/api/pub/user/set-current-year";
    try {
      Response<dynamic> response = await httpClient.post(
        apiAddress,
        queryParameters: param.toMap(),
        options: _getHeaders(token),
      );

      return ServerResponseDto.fromMap(jsonDecode(response.data));
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }

  Options _getHeaders(String token) {
    return Options(headers: {
      "Authorization": "Bearer $token",
      'content-type': jsonContentType,
    }, contentType: jsonContentType);
  }
}
