import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';
import 'package:toolo_gostar/data/datasources/accounting/accounting_remote_data_source.dart';
import 'package:toolo_gostar/data/repositories/accounting/account_repository_impl.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';
import 'package:toolo_gostar/domain/repositories/fiscal_year/fiscal_repository.dart';
import 'package:toolo_gostar/domain/usecases/accounting/account_list_have_tafzili_group_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_available_bank_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_bank_acc_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_bourse_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_category_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_currency_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_customer_status_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_detail_group_root_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_document_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_person_type_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_prefix_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/base/fetch_standard_detail_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/create_counter_party_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/create_counterparty_detail_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/create_document_detail_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/create_document_master_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/document_master_detail_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/document_master_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/document_total_price_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_actions_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_cash_box_list.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_people_list_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/get_revolving_found_list.dart';
import 'package:toolo_gostar/domain/usecases/accounting/tafzili_group_and_child_list_with_account_id_use_case.dart';
import 'package:toolo_gostar/domain/usecases/auth/get_user_data_usecase.dart';
import 'package:toolo_gostar/domain/usecases/auth/login_usecase.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/get_fiscal_year_use_case.dart';
import 'package:toolo_gostar/domain/usecases/fiscal_year/set_current_fiscal_year_use_case.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';

import '../data/datasources/auth/auth_local_data_source_impl.dart';
import '../data/datasources/auth/remote_data_source.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/fiscal_year/fiscal_repository.dart';
import '../domain/usecases/accounting/base/create_standard_detail_use_case.dart';
import '../domain/usecases/accounting/base/fetch_city_list_use_case.dart';
import '../domain/usecases/accounting/base/update_standard_detail_use_case.dart';
import '../domain/usecases/accounting/create_account_use_case.dart';
import '../domain/usecases/accounting/delete_account_use_case.dart';
import '../domain/usecases/accounting/delete_counter_party_use_case.dart';
import '../domain/usecases/accounting/fetch_balance_and_ledgers_report_list_usecases.dart';
import '../domain/usecases/accounting/get_accounting_list_use_case.dart';
import '../domain/usecases/accounting/get_bank_list.dart';
import '../domain/usecases/accounting/get_card_reader_list.dart';
import '../domain/usecases/accounting/get_customer_detail_list_use_case.dart';
import '../domain/usecases/accounting/get_detail_account_group_list_use_case.dart';
import '../domain/usecases/accounting/update_account_use_case.dart';
import '../domain/usecases/accounting/update_counter_party_use_case.dart';
import '../domain/usecases/accounting/update_counterparty_detail_use_case.dart';
import '../domain/usecases/auth/get_token_usecase.dart';
import '../presentation/blocs/main_bloc/main_bloc.dart';
import '../presentation/blocs/report_bloc/report_bloc.dart';

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
  locator.registerLazySingleton<DocDetailBloc>(() => DocDetailBloc());
  locator.registerLazySingleton<FiscalYearBloc>(() => FiscalYearBloc());
  locator.registerLazySingleton<ReportBloc>(() => ReportBloc());
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
  locator.registerLazySingleton(() => CreateAccountUseCase(locator()));
  locator.registerLazySingleton(() => UpdateAccountUseCase(locator()));
  locator.registerLazySingleton(() => DeleteAccountUseCase(locator()));

  locator.registerLazySingleton(() => FetchTafziliGroupAndChildListWithAccountIdUseCase(locator()));
  locator.registerLazySingleton(() => FetchAccountListHaveTafziliGroupUseCase(locator()));

  locator.registerLazySingleton(() => CreateCounterpartyUseCase(locator()));
  locator.registerLazySingleton(() => UpdateCounterpartyUseCase(locator()));
  locator.registerLazySingleton(() => DeleteCounterpartyUseCase(locator()));

  locator
      .registerLazySingleton(() => GetDetailAccountGroupListUseCase(locator()));

  locator.registerLazySingleton(() => GetPeopleListUseCase(locator()));
  locator.registerLazySingleton(() => GetBankListUseCase(locator()));
  locator.registerLazySingleton(() => GetCardReaderListUseCase(locator()));
  locator.registerLazySingleton(() => GetRevolvingFundListUseCase(locator()));
  locator.registerLazySingleton(() => GetCashBoxListUseCase(locator()));

  locator.registerLazySingleton(() => FetchDocumentMasterListUseCase(locator()));
  locator.registerLazySingleton(() => FetchDocumentMasterDetailListUseCase(locator()));
  locator.registerLazySingleton(() => CreateDocumentMasterUseCase(locator()));
  locator.registerLazySingleton(() => CreateDocumentDetailUseCase(locator()));
  locator.registerLazySingleton(() => FetchDocumentTotalPriceUseCase(locator()));

  //AccountingBaseUseCase
  locator.registerLazySingleton(() => FetchBankAccTypeListUseCase(locator()));

  locator.registerLazySingleton(() => FetchBourseTypeListUseCase(locator()));

  locator.registerLazySingleton(() => FetchCurrencyTypeListUseCase(locator()));

  locator
      .registerLazySingleton(() => FetchDetailGroupRootListUseCase(locator()));

  locator.registerLazySingleton(() => FetchDocumentTypeListUseCase(locator()));

  locator.registerLazySingleton(() => FetchPersonTypeListUseCase(locator()));

  locator.registerLazySingleton(() => FetchPrefixListUseCase(locator()));
  locator.registerLazySingleton(() => FetchCategoryListUseCase(locator()));

  locator
      .registerLazySingleton(() => FetchCustomerStatusListUseCase(locator()));

  locator.registerLazySingleton(() => FetchAvailableBankListUseCase(locator()));

  locator
      .registerLazySingleton(() => FetchStandardDetailListUseCase(locator()));

  locator.registerLazySingleton(() => CreateStandardDetailUseCase(locator()));

  locator.registerLazySingleton(() => UpdateStandardDetailUseCase(locator()));

  locator.registerLazySingleton(() => FetchCityListUseCase(locator()));

  locator.registerLazySingleton(() => GetCustomerDetailListUseCase(locator()));

  locator
      .registerLazySingleton(() => CreateCounterpartyDetailUseCase(locator()));

  locator
      .registerLazySingleton(() => UpdateCounterpartyDetailUseCase(locator()));

  //AccountingReportsUseCases
  locator
      .registerLazySingleton(() => FetchBalanceAndLedgersReportListUseCase(locator()));
  //AuthRepository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator(), locator()));

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
