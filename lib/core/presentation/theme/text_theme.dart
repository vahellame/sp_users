import 'package:sp_users/core/presentation/presentation.dart';

const _fontName = 'Nunito';

const _defaultTextStyle = TextStyle(fontFamily: _fontName);

//ignore: long-method
TextTheme textTheme([Color color = Colors.black]) {
  return TextTheme(
    //
    // h1
    headline1: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 32,
    ),
    //
    // h2
    headline2: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 23,
    ),
    //
    // title / button
    headline6: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 18,
    ),
    //
    // subtitle
    subtitle1: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      height: 1.2,
      fontSize: 16,
    ),
    //
    // constrast_subtitle
    subtitle2: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    //
    // tab_text
    headline3: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 15,
    ),
    //
    // medium_text / text_button
    bodyText1: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 14,
      height: 1.2,
    ),
    //
    // button
    button: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 16,
      height: 1.3,
    ),
    //
    // constrast_medium_text
    bodyText2: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    //
    // priority_chip
    caption: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 13,
    ),
    //
    // text / chip / element / subtitle_description
    headline5: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 12,
    ),
    //
    // sign
    overline: _defaultTextStyle.copyWith(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 11,
      letterSpacing: 0,
    ),
  );
}
