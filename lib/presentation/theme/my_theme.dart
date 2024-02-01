
part of main_toolo_gostar;

const double _wordSpacing = -2;
class MyAppThemeConfig {
  static const String faPrimaryFontFamily = FontFamily.vazir;
  static const String enPrimaryFontFamily = FontFamily.vazir;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryColor;
  final Color smallTextColor;
  final Color onSecondaryTextColor;
  final Color primaryColor;
  final Color onPrimaryColor;
  final Color surfaceColor;
  final Color onSurfaceColor;
  final Color scaffoldBackgroundColor;
  final Color onBackgroundColor;
  final Color appBarColor;
  final Color onAppBarColor;
  final Color errorColor;
  final Color onErrorColor;
  final Color outlineColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = const Color(0xff181717),
        secondaryTextColor = const Color(0xff006ea4),
        onSecondaryTextColor = Colors.white,
        smallTextColor = const Color(0xff818791),
        primaryColor = const Color(0xff008fd5),
        appBarColor = const Color(0xff008fd5),
        onAppBarColor = Colors.white,
        onPrimaryColor = Colors.white,
        surfaceColor = Colors.white,
        onSurfaceColor = const Color(0x66a7a9ac),
        scaffoldBackgroundColor = Colors.white,
        onBackgroundColor = const Color(0xff376AED),
        errorColor = Colors.black,
        onErrorColor = Colors.white,
        outlineColor = const Color(0xffE0E0E0),
        tertiaryColor = const Color(0x66a7a9ac),
        brightness = Brightness.light;

  MyAppThemeConfig.light()
      : primaryTextColor = const Color(0xff006ea4),
        secondaryTextColor = const Color(0xff181717),
        onSecondaryTextColor = Colors.white,
        smallTextColor = const Color(0xff818791),
        primaryColor = const Color(0xff008fd5),
        appBarColor = const Color(0xff008fd5),
        onAppBarColor = Colors.white,
        onPrimaryColor = Colors.white,
        surfaceColor = Colors.white,
        onSurfaceColor = const Color(0xff000000),
        scaffoldBackgroundColor = Colors.white,
        onBackgroundColor = const Color(0xff376AED),
        errorColor = Colors.black,
        onErrorColor = Colors.white,
        outlineColor = const Color(0xffE0E0E0),
        tertiaryColor = const Color(0x66a7a9ac),
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      // This is the theme of My application.
      colorScheme: ColorScheme(
          brightness: brightness,
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryTextColor,
          tertiary: tertiaryColor,
          onSecondary: onSecondaryTextColor,
          outline: outlineColor,
          error: errorColor,
          onError: onErrorColor,
          background: scaffoldBackgroundColor,
          onBackground: onBackgroundColor,
          surface: surfaceColor,
          onSurface: onSurfaceColor),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primarySwatch: generateMaterialColor(color: primaryColor),

      appBarTheme: AppBarTheme(
          titleSpacing: 0,
          centerTitle: false,
          titleTextStyle: titleMesiumStyle().copyWith(color: onAppBarColor),
          backgroundColor: appBarColor,
          actionsIconTheme: IconThemeData(size: 36, color: onAppBarColor),
          foregroundColor: onAppBarColor),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: titleMesiumStyle(),
        backgroundColor: onBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: surfaceColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            primaryColor,
          ),
        ),
      ),
      dividerColor: surfaceColor,
      textTheme:
          languageCode == 'fa' ? faPrimaryTextTheme : enPrimaryTextTheme,
    );
  }

  TextTheme get faPrimaryTextTheme => baseTextTheme;

  TextTheme get enPrimaryTextTheme => baseTextTheme;

  get baseTextTheme => TextTheme(
        titleLarge: titleLargeStyle(),
        titleMedium: titleMesiumStyle(),
        titleSmall: titleSmallStyle(),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            wordSpacing: _wordSpacing,
            color: primaryTextColor,
            height: 1.5,
            fontFamily: faPrimaryFontFamily),
        bodySmall: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 11,
            wordSpacing: _wordSpacing,
            color: smallTextColor,
            height: 1.5,
            fontFamily: faPrimaryFontFamily),
        labelLarge: TextStyle(
            fontWeight: FontWeight.bold,
            wordSpacing: _wordSpacing,
            fontSize: 16,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        labelMedium: TextStyle(
            fontWeight: FontWeight.normal,
            wordSpacing: _wordSpacing,
            fontSize: 14,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        labelSmall: TextStyle(
            fontWeight: FontWeight.normal,
            wordSpacing: _wordSpacing,
            fontSize: 9,
            height: 1.5,
            color: smallTextColor,
            fontFamily: faPrimaryFontFamily),
      );

  TextStyle titleSmallStyle() {
    return TextStyle(
        fontSize: 12,
        wordSpacing: _wordSpacing,
        height: 1.5,
        fontWeight: FontWeight.normal,
        color: smallTextColor,
        fontFamily: faPrimaryFontFamily);
  }

  TextStyle titleMesiumStyle() {
    return TextStyle(
        fontSize: 15,
        wordSpacing: _wordSpacing,
        height: 1.5,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily);
  }

  TextStyle titleLargeStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        wordSpacing: _wordSpacing,
        fontSize: 17,
        height: 1.5,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily);
  }
}
