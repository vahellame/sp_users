import 'package:sp_users/core/presentation/presentation.dart';

class UCard extends StatelessWidget {
  const UCard({
    Key? key,
    required this.child,
    this.padding = DesignConstants.padding,
    this.borderRadius = DesignConstants.borderRadius,
    this.color = Colors.white,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color color;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Material(
        color: color,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: padding,
          child: AnimatedSize(
            duration: 100.milliseconds,
            curve: Curves.ease,
            child: child,
          ),
        ),
      ),
    );
  }
}
