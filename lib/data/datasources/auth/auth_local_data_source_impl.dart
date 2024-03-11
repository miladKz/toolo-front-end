import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/data/datasources/auth/auth_local_data_source.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';

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
    var object = _sharedPreferences.getString(keyLoginUserInfo) ?? "";
    return AuthBaseDataDto.fromMap(jsonDecode(object)).token;
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
