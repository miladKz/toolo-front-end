import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';
import 'package:toolo_gostar/data/models/auth/user_data.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_remote_entities.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_remote_repository.dart';

class AuthRemoteRepositoryImpl extends IAuthRemoteRepository {
  final IAuthRemoteEntities dataSource;

  AuthRemoteRepositoryImpl(this.dataSource);

  @override
  Future<AuthBaseData> login(
      {required String userName,
      required String cleanPassWord,
      required String baseUrl}) async {

    final dto = await dataSource.login(
        userName: userName, cleanPassWord: cleanPassWord, baseUrl: baseUrl);
    if (dto.isSuccess) {
      final Map<String, dynamic> data = dto.data!['data'];
      final String token = data['MetaData']['Token'];
      final UserData userData = UserData.fromMap(data['MetaData']['User']);
      return AuthBaseData(token: token, userData: userData);
    } else {
      throw dto.authErrorState!;
    }
  }
}
