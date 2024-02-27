import 'package:toolo_gostar/data/models/auth/user_data.dart';

class AuthBaseData {
  final UserData userData;
  final String token;

  AuthBaseData({required this.userData, required this.token});
}
