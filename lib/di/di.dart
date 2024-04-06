import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';
import 'package:toolo_gostar/data/datasources/accounting/accounting_remote_data_source.dart';
import 'package:toolo_gostar/data/repositories/accounting/account_repository_impl.dart';
import 'package:toolo_gostar/data/repositories/customers_and_sales/customers_and_sales_repository_impl.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';
import 'package:toolo_gostar/domain/repositories/fiscal_year/fiscal_repository.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';
import 'package:toolo_gostar/domain/usecases/auth/get_user_data_usecase.dart';
import 'package:toolo_gostar/domain/usecases/auth/login_usecase.dart';
import 'package:toolo_gostar/domain/usecases/customers_and_sales/get_customer_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/get_fiscal_year_use_case.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/set_current_fiscal_year_use_case.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';

import '../data/datasources/auth/auth_local_data_source_impl.dart';
import '../data/datasources/auth/remote_data_source.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/fiscal_year/fiscal_repository.dart';
import '../domain/repositories/customers_and_sales/customers_and_sales_repository.dart';
import '../domain/usecases/accounting/create_account_use_case.dart';
import '../domain/usecases/accounting/delete_account_use_case.dart';
import '../domain/usecases/accounting/get_accounting_list_use_case.dart';
import '../domain/usecases/accounting/get_detail_account_group_list_use_case.dart';
import '../domain/usecases/accounting/update_account_use_case.dart';
import '../domain/usecases/auth/get_token_usecase.dart';
import '../presentation/blocs/main_bloc/main_bloc.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> setupLocator(SharedPreferences sharedPreferences) async {
  locator.allowReassignment = true;
  locator.registerLazySingleton<AppLocalizations>(() => localization);
  locator.registerLazySingleton<ThemeData>(() => Theme.of(Get.context!));

  //Bloc
  locator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  locator.registerLazySingleton<MainBloc>(() => MainBloc());
  locator.registerLazySingleton<FiscalYearBloc>(() => FiscalYearBloc());
  locator.registerLazySingleton<ThemeData>(() => Theme.of(Get.context!));

  //AuthUseCases
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => GetUserDataUseCase(locator()));
  locator.registerLazySingleton(() => GetTokenUseCase(locator()));

  //FiscalUseCases
  locator.registerLazySingleton(() => GetFiscalYearsUseCase(locator()));
  locator.registerLazySingleton(() => SetCurrentFiscalYearUseCase(locator()));

  //AccountingUseCases
  locator.registerLazySingleton(() => GetActionsUseCase(locator()));
  locator.registerLazySingleton(() => GetAccountListUseCase(locator()));
  locator.registerLazySingleton(() => UpdateAccountUseCase(locator()));
  locator.registerLazySingleton(() => CreateAccountUseCase(locator()));
  locator.registerLazySingleton(() => DeleteAccountUseCase(locator()));

  locator.registerLazySingleton(() => GetDetailAccountGroupListUseCase(locator()));

  //CustomersAndSalesUseCases
  locator.registerLazySingleton(() => GetCustomerListUseCase(locator()));

  //AuthRepository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator(), locator()));

  //CustomerAndSalesRepository
  locator.registerLazySingleton<ICustomersAndSalesRepository>(
          () => CustomersAndSalesRepositoryImpl(locator(), locator()));
  //FiscalRepository
  locator.registerLazySingleton<FiscalRepository>(
      () => FiscalRepositoryImpl(locator(), locator()));

  //AccountingRepository
  locator.registerLazySingleton<IAccountingRepository>(
      () => AccountingRepositoryImpl(locator(), locator()));

  //DataSource
  locator.registerLazySingleton(() => RemoteDataSource(httpClient: locator()));
  locator.registerLazySingleton(() => AuthLocalDataSourceImpl(locator()));

  //AccountingDataSource
  locator.registerLazySingleton(
      () => AccountingRemoteDataSource(httpClient: locator()));

  //! External

  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => httpClient);
}
