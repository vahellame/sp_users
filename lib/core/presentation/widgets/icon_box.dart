import 'package:sp_users/core/presentation/presentation.dart';

class UIconBox extends StatelessWidget {
  const UIconBox(
    this.iconData, {
    Key? key,
    this.iconColor = Colors.white,
    this.color = Colors.black,
    this.padding = DesignConstants.padding10,
    this.size = 20,
    this.borderRadius = DesignConstants.borderRadius,
  }) : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final Color color;
  final EdgeInsets padding;
  final double size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: size,
      ),
    );
  }
}
