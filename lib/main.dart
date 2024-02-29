library main_toolo_gostar;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/gen/fonts.gen.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_auth.dart';
import 'package:toolo_gostar/presentation/theme/material_color.dart';

part 'presentation/theme/my_theme.dart';

late AppLocalizations localization;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        init(context, themData);
        return authScreen();
      }),
    );
  }

  Future<void> init(BuildContext context, ThemeData themData) async {
    localization = AppLocalizations.of(context)!;
    await setupLocator();
  }
}

Widget authScreen() {
  return BlocProvider(
    create: (_) {
      return locator<AuthBloc>();
    },
    child: const ScreenAuth(),
  );
}
