part of '../ui_kit.dart';

abstract class ColorTheme {
  static const backgroundLight = Color(0xFFFFFFFF);
  static const greyLight = Color(0xFFF2F2F2);

  static const backgroundDark = Color(0xFF0B1E2D);
  static const greyDark = Color(0xFF152A3A);
  static const white100Dark = Color(0xFF5B6975);
  static const blue900 = Color(0xFF22A2BD);
  static const greenDark = Color(0xFF43D049);
  static const redDark = Color(0xFFEB5757);

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: backgroundLight,
    onPrimary: white100Dark,
    background: backgroundLight,
    onBackground: white100Dark,
    surface: backgroundDark,
    secondary: greenDark,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: backgroundDark,
    onPrimary: white100Dark,
    background: backgroundDark,
    onBackground: white100Dark,
    surface: backgroundDark,
    secondary: greenDark,
  );

  static ThemeData lightTheme = ThemeData.from(colorScheme: lightColorScheme);
  static ThemeData darkTheme = ThemeData.from(colorScheme: darkColorScheme);
}
