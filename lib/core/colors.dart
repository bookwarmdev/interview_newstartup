import 'package:flutter/material.dart';

// https://developer.android.com/reference/kotlin/androidx/compose/material/Colors
// https://material-foundation.github.io/material-theme-builder/#/custom
// https://coolors.co/83383a

class AppColor {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF316B00),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFADF674),
    onPrimaryContainer: Color(0xFF0B2000),
    secondary: Color(0xFF56624B),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDAE7C9),
    onSecondaryContainer: Color(0xFF141E0C),
    tertiary: Color(0xFF386665),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBBECEA),
    onTertiaryContainer: Color(0xFF002020),
    error: Color(0xFFBA1B1B),
    errorContainer: Color(0xFFFFDAD4),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410001),
    background: Color(0xFFFDFDF5),
    onBackground: Color(0xFF1A1C17),
    surface: Color(0xFFFDFDF5),
    onSurface: Color(0xFF1A1C17),
    surfaceVariant: Color(0xFFE0E4D6),
    onSurfaceVariant: Color(0xFF44483E),
    outline: Color(0xFF74796D),
    onInverseSurface: Color(0xFFF2F1EA),
    inverseSurface: Color(0xFF2F312C),
    inversePrimary: Color(0xFF93D95C),
    shadow: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF93D95C),
    onPrimary: Color(0xFF163800),
    primaryContainer: Color(0xFF235100),
    onPrimaryContainer: Color(0xFFADF674),
    secondary: Color(0xFFBECBAE),
    onSecondary: Color(0xFF29341F),
    secondaryContainer: Color(0xFF3F4A35),
    onSecondaryContainer: Color(0xFFDAE7C9),
    tertiary: Color(0xFFA0CFCD),
    onTertiary: Color(0xFF003736),
    tertiaryContainer: Color(0xFF1E4E4D),
    onTertiaryContainer: Color(0xFFBBECEA),
    error: Color(0xFFFFB4A9),
    errorContainer: Color(0xFF930006),
    onError: Color(0xFF680003),
    onErrorContainer: Color(0xFFFFDAD4),
    background: Color(0xFF1A1C17),
    onBackground: Color(0xFFE3E3DC),
    surface: Color(0xFF1A1C17),
    onSurface: Color(0xFFE3E3DC),
    surfaceVariant: Color(0xFF44483E),
    onSurfaceVariant: Color(0xFFC4C8BB),
    outline: Color(0xFF8E9286),
    onInverseSurface: Color(0xFF1A1C17),
    inverseSurface: Color(0xFFE3E3DC),
    inversePrimary: Color(0xFF316B00),
    shadow: Color(0xFF000000),
  );
}
