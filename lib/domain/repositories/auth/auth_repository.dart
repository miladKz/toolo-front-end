import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';

abstract class AuthRepository {
  Future<AuthBaseData> login({
    required String userName,
    required String password,
    required String serverAddress,
  });

  String getToken();
}
