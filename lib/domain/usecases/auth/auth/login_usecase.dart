import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_remote_repository.dart';

class LoginUseCase {
  final IAuthRemoteRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<AuthBaseData> call(
      {required String userName,required String password,required String baseUrl}) async {
    return await _repository.login(
        userName: userName, cleanPassWord: password, baseUrl: baseUrl);
  }
}
