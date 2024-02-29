import 'package:toolo_gostar/data/common/models/server_response_dto.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data_dto.dart';
import 'package:toolo_gostar/data/models/auth/params/login_param_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';

import '../../datasources/auth/remote_data_source.dart';

class AuthRemoteRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRemoteRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthBaseData> login(
      {required String userName,
      required String password,
      required String serverAddress}) async {
    LoginParamDto param = LoginParamDto(
        userName: userName, password: password, serverAddress: serverAddress);
    try {
      ServerResponseDto serverResponse =
          await remoteDataSource.login(loginParam: param);
      if (serverResponse.isSuccess) {
        return AuthBaseDataDto.fromMap(serverResponse.data!);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
