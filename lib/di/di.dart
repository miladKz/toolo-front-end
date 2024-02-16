import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
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
}

