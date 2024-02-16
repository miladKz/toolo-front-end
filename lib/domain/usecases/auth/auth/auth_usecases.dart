import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';

abstract class IAuthRepository {
  Future<AuthBaseData> login({
    required String userName,
    required String cleanPassWord,
    required String baseUrl,
  });

  Future<AuthBaseData> persistAuthBaseData(
      {required AuthBaseData authBaseData});

  Future<AuthBaseData> loadAuthBaseData();

  Future<void> persistLoginInfo({
    required String userName,
    required String cleanPassWord,
    required String baseUrl,
  });

  Future<bool> persistRemember(bool isRemember);

  Future<bool> isRemember();

  Future<String> getBaseUrl();

  Future<String> getCleanPassword();

  Future<String> getToken();
}
