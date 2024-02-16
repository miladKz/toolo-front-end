import 'dart:convert';

import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';
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
      final Map<String, dynamic> data =
          jsonDecode(dto.data!.findAsString('data'));
      final String token = data.findAsString('token');
      return AuthBaseData(baseUrl: baseUrl, token: token);
    } else {
      throw dto.authErrorState!;
    }
  }
}
