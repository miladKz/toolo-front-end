import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';
import 'package:toolo_gostar/domain/usecases/auth/auth/get_token_usecase.dart';
import 'package:toolo_gostar/domain/usecases/auth/auth/login_usecase.dart';
import 'package:toolo_gostar/domain/usecases/auth/fiscal/set_current_fiscal_year_use_case.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';

import '../data/datasources/auth/auth_local_data_source_impl.dart';
import '../data/datasources/auth/remote_data_source.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/auth/fiscal_repository.dart';
import '../domain/repositories/fiscal/fiscal_repository.dart';
import '../domain/usecases/auth/fiscal/get_fiscal_year_use_case.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> setupLocator() async {
  locator.allowReassignment = true;
  locator.registerLazySingleton<AppLocalizations>(() => localization);
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  locator.registerLazySingleton<FiscalYearBloc>(() => FiscalYearBloc());
  locator.registerLazySingleton<ThemeData>(() => Theme.of(Get.context!));
  //UseCases
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => GetTokenUseCase(locator()));
  locator.registerLazySingleton(() => GetFiscalYearsUseCase(locator()));
  locator.registerLazySingleton(() => SetCurrentFiscalYearUseCase(locator()));

  //AuthRepository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator(), locator()));

  //FiscalRepository
  locator.registerLazySingleton<FiscalRepository>(
      () => FiscalRepositoryImpl(locator(), locator()));
  //DataSource
  locator.registerLazySingleton(() => RemoteDataSource(httpClient: locator()));
  locator.registerLazySingleton(() => AuthLocalDataSourceImpl(locator()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => Dio());
}
