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
      "password": Uri.decodeFull(cleanPassWord)
    };
    String apiAddress = "/api/user/login";
    String fullPath = baseUrl + apiAddress;
    try {
      Response<dynamic> response =
      await httpClient.post(fullPath, queryParameters: param);
      if (response.statusCode == 200) {
        return  AuthDto.toMap(isSuccess: true,result: response.data);
      }else{
        return AuthDto.toMap(isSuccess: false);
      }
    } catch (e) {
      return AuthDto.toMap(isSuccess: false, errorMessage: e.toString());
    }
  }

}