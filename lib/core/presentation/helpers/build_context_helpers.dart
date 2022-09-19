import 'package:sp_users/core/presentation/presentation.dart';

extension UBuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension UBuildContextLocalizationExtensions on BuildContext {
  App get localization => AppLocalizations.of(this);
}

extension UBuildContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  double get textScaleFactor => mediaQuery.textScaleFactor;
}
