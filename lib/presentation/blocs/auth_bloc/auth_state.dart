part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState(this.isRemember);
  final bool isRemember;
  @override
  List<Object> get props => [isRemember];
}

class AuthInitial extends AuthState {
  const AuthInitial(super.isRemember);
}

class AuthLoading extends AuthState {
  const AuthLoading(super.isRemember);
}

class AuthLoadingOnView extends AuthState {
  final bool isShow;
  const AuthLoadingOnView(super.isRemember, {required this.isShow});
}

class AuthRememberChange extends AuthState {
  const AuthRememberChange(super.isRemember);
}

class AuthError extends AuthState {
  final AppException appException;
  final AuthErrorState errorState;

  const AuthError(super.isRemember,
      {required this.appException, required this.errorState});
}

class AuthSuccess extends AuthState {
  final AuthBaseData authBaseData;
  const AuthSuccess(super.isRemember, {required this.authBaseData});
  @override
  List<Object> get props => [isRemember, authBaseData];
}

class AuthFailed extends AuthState {
  const AuthFailed(super.isRemember);
}
