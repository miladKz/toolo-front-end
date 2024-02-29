part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class Authentication extends AuthEvent {
  final String userName;
  final String cleanPassWord;
  final String baseUrl;

  const Authentication(
      {required this.userName,
      required this.cleanPassWord,
      required this.baseUrl});
}

class BiometricsAuthentication extends AuthEvent {
  const BiometricsAuthentication();
}

class AtrasEmitState extends AuthEvent {
  final AuthState uthState;

  const AtrasEmitState(this.uthState);
}

class AutoAuthentication extends AuthEvent {
  final String userName;
  final String hashPassword;

  const AutoAuthentication(
      {required this.userName, required this.hashPassword});

  @override
  List<Object> get props => [userName, hashPassword];
}

class AuthRememberStatusChange extends AuthEvent {
  const AuthRememberStatusChange();
}
