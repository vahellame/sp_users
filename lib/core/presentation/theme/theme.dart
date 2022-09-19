import 'package:sp_users/core/presentation/presentation.dart';

ThemeData get theme {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.white,
    ),
    textTheme: textTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: DesignConstants.borderRadiusMini,
        ),
      ),
    ),
  );
}
