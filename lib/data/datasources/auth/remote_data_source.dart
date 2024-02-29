import 'dart:io';

import 'package:dio/dio.dart';
import 'package:toolo_gostar/data/common/mixin/http_response_validator.dart';
import 'package:toolo_gostar/data/common/models/server_response_dto.dart';

import '../../models/auth/params/login_param_dto.dart';

class RemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

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
}
