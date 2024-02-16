import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toolo_gostar/data/common/mixin/http_response_validator.dart';
import 'package:toolo_gostar/data/models/auth/auth_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_remote_entities.dart';

class AuthRemoteDataSourceImpl with HttpResponseValidator implements IAuthRemoteEntities{
final Dio httpClient;

  AuthRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<AuthDto> login({required String userName, required String cleanPassWord, required String baseUrl})async {
    final Map<String, dynamic> param = {
      "username": userName,
      "password": cleanPassWord
    };
    try {
      Response<dynamic> response =
      await httpClient.post("/api/user/login", queryParameters: param);
      if (response.statusCode == 200) {
        return AuthDto.toMap(isSuccess: true,result: jsonDecode(response.data));
      }else{
        return AuthDto.toMap(isSuccess: false);
      }
    } catch (e) {
      e.toString();
      return AuthDto.toMap(isSuccess: false);
    }
  }

}