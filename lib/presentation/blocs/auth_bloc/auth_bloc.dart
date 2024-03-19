import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/app_exception.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';
import 'package:toolo_gostar/data/common/network_connection/network_connection_state.dart';
import 'package:toolo_gostar/data/enum/auth_error_state.dart';
import 'package:toolo_gostar/domain/entities/auth/auth_base_data.dart';
import 'package:toolo_gostar/domain/entities/auth/params/login_param.dart';
import 'package:toolo_gostar/domain/usecases/auth/login_usecase.dart';

import '../../../di/di.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool userNameInputValid = true;
  bool passwordInputValid = true;
  bool urlInputValid = true;
  bool isRemember;
  var tryCount = 0;
  var maxTry = 1;
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late TextEditingController _urlController;
  late TextEditingController _portController;

  AuthBloc({this.isRemember = true}) : super(AuthInitial(isRemember)) {
    _userNameController = TextEditingController(text: 'abbasi');
    _passwordController = TextEditingController(text: '123456');
    _urlController = TextEditingController(text: 'http://46.249.101.180');
    _portController = TextEditingController(text: '8090');
    HttpClient.urlNotifier.addListener(HttpClient.urlListener);
    NetworkConnectionState.networkConnectionStateNotifier
        .addListener(NetworkConnectionState.networkConnectionStateListener);

    on<Authentication>(_authentication);
    on<AuthChangeUrlBoxVisibiliti>(_authChangeUrlBoxVisibiliti);
    on<AtrasEmitState>(_atrasEmitState);
  }

  TextEditingController get userNameController => _userNameController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get urlController => _urlController;

  TextEditingController get portController => _portController;

  bool get isInputDataValid {
    return userNameInputValid && passwordInputValid && urlInputValid;
  }

  FutureOr<void> _authentication(
      Authentication event, Emitter<AuthState> emit) async {
    if (event.userName.isNotEmpty) {
      emit(AuthLoadingOnView(isRemember, isShow: true));
      String baseUrl = event.baseUrl;
      String cleanPassWord = event.cleanPassWord;
      HttpClient.urlNotifier.value = baseUrl;
      try {
        LoginUseCase loginUseCase = locator<LoginUseCase>();
        LoginParam loginParam = LoginParam(
            userName: userNameController.text,
            password: cleanPassWord,
            serverAddress: baseUrl);

        AuthBaseData authBaseData = await loginUseCase(loginParam);
        emit(AuthSuccess(isRemember, authBaseData: authBaseData));
      } catch (e) {
        e.toString();
        emit(AuthError(isRemember,
            appException: AppException(message: e.toString()),
            errorState: AuthErrorState.unknownError));
      }
    } else {
      emit(AuthError(isRemember,
          appException: AppException(message: ''),
          errorState: AuthErrorState.usernameOrPassCanNotEmpty));
    }
  }

  FutureOr<void> _authChangeUrlBoxVisibiliti(
      AuthChangeUrlBoxVisibiliti event, Emitter<AuthState> emit) {
    add(AtrasEmitState(AuthVisibleUrlBox(isRemember)));
  }

  FutureOr<void> _atrasEmitState(
      AtrasEmitState event, Emitter<AuthState> emit) {
    emit(event.uthState);
  }
}
