import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:toolo_gostar/data/common/mixin/http_response_validator.dart';
import 'package:toolo_gostar/data/common/models/server_response_dto.dart';

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
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

  Future<ServerResponseDto> getAccountList({required String token}) async {
    String apiAddress = "/api/acc/accounts/list";
    String fullPath = baseUrl + apiAddress;
    try {
      Response<dynamic> response = await httpClient.get(
        fullPath,
        options: _getHeaders(token),
      );
      debugPrint(response.data);
      return ServerResponseDto.fromMap(getData(response));
    } on DioException catch (e) {
      print(e);
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
  return  jsonDecode(response.data);
  }
}
