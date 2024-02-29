import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_local_entities.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_local_repository.dart';

class AuthLocalRepositoryImpl extends IAuthLocalRepository {
  final IAuthLocalEntities dataSource;

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
    return await dataSource.getToken();
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
  Future<AuthBaseData> persistAuthBaseData(
      {required AuthBaseData authBaseData}) async {
    return await dataSource.persistAuthBaseData(authBaseData: authBaseData);
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
}
