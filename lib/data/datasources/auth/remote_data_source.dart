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

  @override
  Future<ServerResponseDto> login({required LoginParamDto loginParam}) async {
    String apiAddress = "/api/user/login";
    String fullPath = loginParam.serverAddress + apiAddress;

    try {
      Response<dynamic> response =
          await httpClient.post(fullPath, queryParameters: loginParam.toMap());
      return ServerResponseDto.fromMap(response.data);
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  @override
  Future<ServerResponseDto> getFiscalYearData({required String token}) async {
    String apiAddress = "/api/user/accessible-year";
    String fullPath = baseUrl + apiAddress;

    try {
      Response<dynamic> response = await httpClient.get(
        fullPath,
        options: _getHeaders(token),
      );

      return ServerResponseDto.fromMap(response.data);
    } catch (e) {
      throw HttpException(e.toString());
    }
  }

  @override
  Future<ServerResponseDto> setCurrentFiscalYear(
      {required String token,
      required SetCurrentFiscalYearParamDto param}) async {
    String apiAddress = "/api/user/set-current-year";
    String fullPath = baseUrl + apiAddress;

    try {
      Response<dynamic> response = await httpClient.post(
        fullPath,
        queryParameters: param.toMap(),
        options: _getHeaders(token),
      );

      return ServerResponseDto.fromMap(response.data);
    } catch (e) {
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
