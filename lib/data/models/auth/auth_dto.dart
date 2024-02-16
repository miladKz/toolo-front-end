import 'package:toolo_gostar/data/enum/auth_error_state.dart';

class AuthDto {
  final bool isSuccess;
  final String errorMessage;
  final AuthErrorState? authErrorState;
  late final Map<String, dynamic>? data;

  AuthDto.toMap(
      {required this.isSuccess,
      this.errorMessage = '',
      this.authErrorState,
      String? result}) {
    if (result != null) {
      data = {key: result};
    }
  }

  get key => 'data';
}
