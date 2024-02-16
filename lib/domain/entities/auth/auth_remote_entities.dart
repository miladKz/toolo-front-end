import 'package:toolo_gostar/data/models/auth/auth_dto.dart';

abstract class IAuthRemoteEntities {
  Future<AuthDto> login({
    required String userName,
    required String cleanPassWord,
    required String baseUrl,
  });

}
