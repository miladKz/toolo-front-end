import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/data/datasources/auth/auth_local_data_source.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/entities/auth/user_data.dart';

class AuthLocalDataSourceImpl extends IAuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<String> getBaseUrl() {
    // TODO: implement getBaseUrl
    throw UnimplementedError();
  }

  @override
  Future<String> getCleanPassword() {
    // TODO: implement getCleanPassword
    throw UnimplementedError();
  }

  @override
  String getToken() {
    return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjcsIlVzZXJOYW1lIjoiYWJiYXNpIiwiRGlzcGxheU5hbWUiOiLYp9io2YjYp9mE2YHYttmEINi52KjYp9iz24wiLCJleHAiOjE3MTIyMTUxMTZ9.UJt4wtiCnvSwlH1n9PqO6HhUAAovqnRoH3xtVPHN-io";
    var object = _sharedPreferences.getString(keyLoginUserInfo) ?? "";
    debugPrint('getToken method data is: $object');
    return AuthBaseDataDto.fromMap(jsonDecode(object)).token;
  }
  @override
  UserData getUserData() {
    var object = _sharedPreferences.getString(keyLoginUserInfo) ?? "";
    debugPrint('getToken method data is: $object');
    return AuthBaseDataDto.fromMap(jsonDecode(object)).userData;
  }

  @override
  Future<bool> isRemember() {
    // TODO: implement isRemember
    throw UnimplementedError();
  }

  @override
  Future<AuthBaseData> loadAuthBaseData() {
    // TODO: implement loadAuthBaseData
    throw UnimplementedError();
  }

  @override
  Future<bool> persistLoginInfo(
      {required String userName,
        required String cleanPassWord,
        required String baseUrl}) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> persistRemember(bool isRemember) {
    // TODO: implement persistRemember
    throw UnimplementedError();
  }

  @override
  Future<AuthBaseDataDto> persistAuthBaseData(
      {required AuthBaseDataDto authBaseData}) async {
    await _sharedPreferences.setString(
      keyLoginUserInfo,
      jsonEncode(authBaseData.toMap()),
    );
    var object = _sharedPreferences.getString(keyLoginUserInfo) ?? "";
    return AuthBaseDataDto.fromMap(jsonDecode(object));
  }
}
