import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';

abstract class IAuthRemoteRepository {
  Future<AuthBaseData> login({
    required String userName,
    required String cleanPassWord,
    required String baseUrl,
  });

}
