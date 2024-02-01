import 'dart:async';
import 'dart:convert';

import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/app_exception.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';
import 'package:toolo_gostar/data/common/network_connection/network_connection_state.dart';
import 'package:toolo_gostar/data/enum/auth_error_state.dart';
import 'package:toolo_gostar/data/models/auth/auth_base_data.dart';

part 'auth_event.dart';

part 'auth_state.dart';

late final TextEditingController _userNameController;
late final TextEditingController _passwordController;
late final TextEditingController _urlController;
late final TextEditingController _portController;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool userNameInputValid = true;
  bool passwordInputValid = true;
  bool urlInputValid = true;
  bool isRemember;
  var tryCount = 0;
  var maxTry = 1;
  AuthBaseData? authBaseData;

  AuthBloc({this.isRemember = true}) : super(AuthInitial(isRemember)) {
    _userNameController = TextEditingController(text: 'user1');
    _passwordController = TextEditingController(text: 'password1');
    _urlController = TextEditingController(text: 'http://46.249.101.180');
    _portController = TextEditingController(text: '8090');
    HttpClient.urlNotifier.addListener(HttpClient.urlListener);
    NetworkConnectionState.networkConnectionStateNotifier
        .addListener(NetworkConnectionState.networkConnectionStateListener);

    on<Authentication>(_authentication);
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
      String baseUrl = event.baseUrl;
      String cleanPassWord = event.cleanPassWord;
      HttpClient.urlNotifier.value = baseUrl;
      final Map<String, dynamic> param = {
        "username": userNameController.text,
        "password": cleanPassWord
      };
      try {
        Response<dynamic> response =
            await httpClient.post("/api/user/login", queryParameters: param);
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.data);
          final String token = data.findAsString('token');
          authBaseData = AuthBaseData(baseUrl: baseUrl, token: token);
          emit(AuthSuccess(isRemember, authBaseData: authBaseData!));
          print(token);
        }
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
}
