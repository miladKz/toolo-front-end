import 'package:toolo_gostar/data/common/models/server_response_dto.dart';
import 'package:toolo_gostar/data/datasources/auth/auth_local_data_source_impl.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data_dto.dart';
import 'package:toolo_gostar/data/models/auth/params/login_param_dto.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';

import '../../datasources/auth/remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;
  final AuthLocalDataSourceImpl localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

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
        AuthBaseDataDto authBaseDataDto =
            AuthBaseDataDto.fromMap(serverResponse.data!);
        AuthBaseDataDto storedData = await localDataSource.persistAuthBaseData(
            authBaseData: authBaseDataDto);

        return storedData;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
