import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/entities/auth/params/login_param.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<AuthBaseData> call(LoginParam param) async {
    return await _repository.login(
        userName: param.userName,
        password: param.password,
        serverAddress: param.serverAddress);
  }
}
