import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_local_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthLocalDataSourceImpl extends IAuthLocalEntities{
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);
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
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
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
  Future<AuthBaseData> persistAuthBaseData({required AuthBaseData authBaseData}) {
    // TODO: implement persistAuthBaseData
    throw UnimplementedError();
  }

  @override
  Future<void> persistLoginInfo({required String userName, required String cleanPassWord, required String baseUrl}) {
    // TODO: implement persistLoginInfo
    throw UnimplementedError();
  }

  @override
  Future<bool> persistRemember(bool isRemember) {
    // TODO: implement persistRemember
    throw UnimplementedError();
  }

}