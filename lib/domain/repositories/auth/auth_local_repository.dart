import 'package:toolo_gostar/data/models/auth/auth_base_data_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';

abstract class IAuthLocalRepository {
  Future<AuthBaseData> persistAuthBaseData(
      {required AuthBaseDataDto authBaseData});

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
}
