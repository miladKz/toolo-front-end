import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_remote_repository.dart';
import 'package:toolo_gostar/domain/usecases/auth/auth/auth_usecases.dart';
import 'package:toolo_gostar/domain/usecases/auth/auth/login_usecase.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';

import '../data/datasources/auth/auth_remote_data_source_impl.dart';
import '../data/repositories/auth/auth_remote_repository_impl.dart';
import '../domain/entities/auth/auth_remote_entities.dart';
final locator = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> setupLocator() async{
  locator.allowReassignment = true;
  locator.registerLazySingleton<AppLocalizations>(()=>localization);
  locator.registerLazySingleton<AuthBloc>(()=>AuthBloc());
  locator.registerLazySingleton<FiscalYearBloc>(()=>FiscalYearBloc());
  locator.registerLazySingleton<ThemeData>(()=>Theme.of(Get.context!));
  locator.registerLazySingleton(() => Dio());
  //AuthEntities
  locator.registerLazySingleton<IAuthRemoteEntities>(() => AuthRemoteDataSourceImpl(httpClient: locator()));

  //AuthUseCsses
  locator.registerLazySingleton(() => LoginUseCase(locator()));

  //AuthRepository
  locator.registerLazySingleton<IAuthRemoteRepository>(
          () =>AuthRemoteRepositoryImpl(locator()));
}

