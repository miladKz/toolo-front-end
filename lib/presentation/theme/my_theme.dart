
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
      : primaryTextColor = const Color(0xff6C3483),
        secondaryTextColor = const Color(0xff0C0C0C),
        onSecondaryTextColor = Colors.white,
        smallTextColor = const Color(0xff828282),
        primaryColor = const Color(0xff6C3483),
        appBarColor = const Color(0xffD9BCE4),
        onAppBarColor = const Color(0xff6C3483),
        onPrimaryColor = Colors.white,
        surfaceColor = Colors.white,
        onSurfaceColor = const Color(0xff0C0C0C),
        scaffoldBackgroundColor =const Color(0xffF9F9F9),
        onBackgroundColor = const Color(0xff6C3483),
        errorColor = const Color(0xffDC3545),
        onErrorColor = Colors.white,
        outlineColor = const Color(0xffF9F9F9),
        tertiaryColor = const Color(0xff7B7B84),
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = const Color(0xff6C3483),
        secondaryTextColor = const Color(0xff0C0C0C),
        onSecondaryTextColor = Colors.white,
        smallTextColor = const Color(0xff828282),
        primaryColor = const Color(0xff6C3483),
        appBarColor = const Color(0xffD9BCE4),
        onAppBarColor = const Color(0xff6C3483),
        onPrimaryColor = Colors.white,
        surfaceColor = Colors.white,
        onSurfaceColor = const Color(0xff0C0C0C),
        scaffoldBackgroundColor =const Color(0xffF9F9F9),
        onBackgroundColor = const Color(0xff6C3483),
        errorColor = const Color(0xffDC3545),
        onErrorColor = Colors.white,
        outlineColor = const Color(0xffF9F9F9),
        tertiaryColor = const Color(0xff7B7B84),
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
          titleTextStyle: titleMediumStyle().copyWith(color: onAppBarColor),
          backgroundColor: appBarColor,
          actionsIconTheme: IconThemeData(size: 36, color: onAppBarColor),
          foregroundColor: onAppBarColor),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: titleMediumStyle(),
        backgroundColor: onBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle:TextStyle(
              fontWeight: FontWeight.w400,
              wordSpacing: _wordSpacing,
              fontSize: 14,
              height: 1.5,
              color: primaryTextColor,
              fontFamily: faPrimaryFontFamily),
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
        titleMedium: titleMediumStyle(),
        titleSmall: titleSmallStyle(),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            wordSpacing: _wordSpacing,
            color: primaryTextColor,
            height: 1.5,
            fontFamily: faPrimaryFontFamily),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            wordSpacing: _wordSpacing,
            color: smallTextColor,
            height: 1.5,
            fontFamily: faPrimaryFontFamily),
        labelLarge: TextStyle(
            fontWeight: FontWeight.w400,
            wordSpacing: _wordSpacing,
            fontSize: 16,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            wordSpacing: _wordSpacing,
            fontSize: 14,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        labelSmall: TextStyle(
            fontWeight: FontWeight.w400,
            wordSpacing: _wordSpacing,
            fontSize: 12,
            height: 1.5,
            color: smallTextColor,
            fontFamily: faPrimaryFontFamily),
      );

  TextStyle titleSmallStyle() {
    return TextStyle(
        fontSize: 14,
        wordSpacing: _wordSpacing,
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: smallTextColor,
        fontFamily: faPrimaryFontFamily);
  }

  TextStyle titleMediumStyle() {
    return TextStyle(
        fontSize: 20,
        wordSpacing: _wordSpacing,
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily);
  }

  TextStyle titleLargeStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        wordSpacing: _wordSpacing,
        fontSize: 24,
        height: 1.5,
        color: primaryTextColor,
        fontFamily: faPrimaryFontFamily);
  }
}
