import 'package:sp_users/core/presentation/presentation.dart';

class DesignConstants {
  // #region borderRadius
  static const Radius borderRadiusValue = Radius.circular(15);
  static const BorderRadius borderRadius = BorderRadius.all(borderRadiusValue);
  static const BorderRadius borderRadiusOnlyTop = BorderRadius.only(
    topLeft: borderRadiusValue,
    topRight: borderRadiusValue,
  );
  static const BorderRadius borderRadiusOnlyBottom = BorderRadius.only(
    bottomLeft: borderRadiusValue,
    bottomRight: borderRadiusValue,
  );

  static const Radius borderRadiusMiniValue = Radius.circular(10);
  static const BorderRadius borderRadiusMini = BorderRadius.all(borderRadiusMiniValue);
  static const BorderRadius borderRadiusMiniOnlyTop = BorderRadius.only(
    topLeft: borderRadiusMiniValue,
    topRight: borderRadiusMiniValue,
  );
  static const BorderRadius borderRadiusMiniOnlyBottom = BorderRadius.only(
    bottomLeft: borderRadiusMiniValue,
    bottomRight: borderRadiusMiniValue,
  );

  static const Radius borderRadiusCircleValue = Radius.circular(100);
  static const BorderRadius borderRadiusCircle = BorderRadius.all(
    borderRadiusCircleValue,
  );
  // #endregion borderRadius

  // #region padding
  static const double paddingValue = 15;
  static const EdgeInsets padding = EdgeInsets.all(paddingValue);

  static const double paddingAltValue = 18;
  static const EdgeInsets paddingAlt = EdgeInsets.symmetric(
    horizontal: paddingValue,
    vertical: paddingAltValue,
  );

  static const double paddingMiniValue = 10;
  static const EdgeInsets paddingMini = EdgeInsets.symmetric(
    horizontal: paddingValue,
    vertical: paddingMiniValue,
  );

  static const EdgeInsets paddingButton = EdgeInsets.symmetric(
    horizontal: paddingAltValue,
    vertical: paddingValue,
  );

  static const EdgeInsets padding10 = EdgeInsets.all(10);
  static const EdgeInsets padding7 = EdgeInsets.all(7);
  static const EdgeInsets padding5 = EdgeInsets.all(5);
  // #endregion padding
}
