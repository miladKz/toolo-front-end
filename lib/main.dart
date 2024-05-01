library main_toolo_gostar;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/gen/fonts.gen.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_auth.dart';
import 'package:toolo_gostar/presentation/pages/screen_document_detail.dart';
import 'package:toolo_gostar/presentation/pages/screen_main.dart';
import 'package:toolo_gostar/presentation/pages/reports/r_d_t_p/screen_report_taraz_dafater_pelekani.dart';
import 'package:toolo_gostar/presentation/pages/test_screen.dart';
import 'package:toolo_gostar/presentation/theme/material_color.dart';

part 'presentation/theme/my_theme.dart';

late AppLocalizations localization;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final ThemeMode _themeMode = ThemeMode.light;

  final Locale _locale = const Locale('fa');

  late ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Toolo Gostar',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.light
          ? MyAppThemeConfig.light().getTheme(_locale.languageCode)
          : MyAppThemeConfig.dark().getTheme(_locale.languageCode),
      home: Builder(builder: (context) {
        themData = Theme.of(context);
        localization = AppLocalizations.of(context)!;
        return screenReport();
      }),
    );
  }
}

Future<void> initLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await setupLocator(sharedPreferences);
}

Widget screenAuth() {
  return BlocProvider(
    create: (_) {
      return locator<AuthBloc>();
    },
    child: const ScreenAuth(),
  );
}

Widget screenDocDetail() {
  DocumentMaster documentMaster =  DocumentMaster(id: 5,
      activeYear: "03/10/12",
      bargeTypeID: 1,
      bargeTypeName: "bargeTypeName",
      categoryID: 2,
      categoryName: "categoryName",
      comment: "comment",
      dateBarge: "dateBarge",
      dateBargeCustom: "dateBargeCustom",
      description: "description",
      isActive: true,
      modulesID: 3,
      modulesName: "حسابداری",
      mustBeReCreate: false,
      number: 10,
      number2: 20,
      numberBarge: 30,
      numberCustom: 35,
      numberDaily: 5,
      numberMonthly: 50,
      persianDate: "persianDate",
      persianTime: "persianTime",
      saveTypeID: 0,
      saveTypeName: "موقت",
      tarazPrice: 0,
      totalPrice: 50000,
      creditorSum: 0,
      debtorSum: 50000,
      remaining: 50000);
  return BlocProvider(
    create: (_) {
      return locator.get<DocDetailBloc>();
    },
    child:  ScreenDocumentDetail(
      documentMaster: documentMaster,
    ),
  );
}

Widget testScreen() {
  return BlocProvider(
    create: (_) {
      return locator<MainBloc>();
    },
    child: TestScreen(),
  );
}

Widget screenMain() {
  return BlocProvider(
    create: (_) {
      return locator<MainBloc>();
    },
    child: const ScreenMain(),
  );
}

Widget screenReport() {
  return BlocProvider(
    create: (_) {
      return locator<ReportBloc>();
    },
    child: const ScreenReportTarazDafaterPelekani(),
  );
}

bool get isDialogOpen {
  bool? isDialogOpen = Get.isDialogOpen;
  return !(isDialogOpen == null || !isDialogOpen);
}
