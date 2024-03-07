import 'dart:io';

import 'package:dio/dio.dart';
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

  Future<ServerResponseDto> getAccountList({required String token}) async {
    String apiAddress = "/api/acc/accounts/list";
    String fullPath = baseUrl + apiAddress;
    try {
      Response<dynamic> response = await httpClient.get(
        fullPath,
        options: _getHeaders(token),
      );
      print(response.data);
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
