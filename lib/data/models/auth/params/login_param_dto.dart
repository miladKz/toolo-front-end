import 'package:toolo_gostar/domain/entities/auth/params/login_param.dart';

class LoginParamDto extends LoginParam {
  LoginParamDto(
      {required super.userName,
      required super.password,
      required super.serverAddress});

  Map<String, dynamic> toMap() {
    return {"username": userName, "password": Uri.decodeFull(password)};
  }
}
