import 'package:toolo_gostar/data/datasources/auth/auth_local_data_source.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_local_repository.dart';

import '../../models/auth/auth_base_data_dto.dart';

class AuthLocalRepositoryImpl extends IAuthLocalRepository {
  final IAuthLocalDataSource dataSource;

  AuthLocalRepositoryImpl(this.dataSource);

  @override
  Future<String> getBaseUrl() async {
    return await dataSource.getBaseUrl();
  }

  @override
  Future<String> getCleanPassword() async {
    return await dataSource.getCleanPassword();
  }

  @override
  Future<String> getToken() async {
    return dataSource.getToken();
  }

  @override
  Future<bool> isRemember() async {
    return await dataSource.isRemember();
  }

  @override
  Future<AuthBaseData> loadAuthBaseData() async {
    return await dataSource.loadAuthBaseData();
  }

  @override
  Future<void> persistLoginInfo(
      {required String userName,
      required String cleanPassWord,
      required String baseUrl}) async {
    return await dataSource.persistLoginInfo(
        userName: userName, cleanPassWord: cleanPassWord, baseUrl: baseUrl);
  }

  @override
  Future<bool> persistRemember(bool isRemember) async {
    return await dataSource.persistRemember(isRemember);
  }

  @override
  Future<AuthBaseData> persistAuthBaseData(
      {required AuthBaseDataDto authBaseData}) async {
    return await dataSource.persistAuthBaseData(authBaseData: authBaseData)
        as AuthBaseData;
  }
}
