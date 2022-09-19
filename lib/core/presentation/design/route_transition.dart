import 'package:sp_users/core/presentation/presentation.dart';

class RouteTransition {
  static Widget animation(
    _,
    Animation<double> animation,
    __,
    Widget child,
  ) {
    const begin = Offset(0, 1);
    const end = Offset.zero;
    final offsetAnimation = Tween(begin: begin, end: end)
        .chain(
          CurveTween(
            curve: const Interval(
              0,
              1,
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          ),
        )
        .animate(animation);

    final scaleAnimation = Tween(begin: 0.9, end: 1.0)
        .chain(
          CurveTween(
            curve: const Interval(
              0.5,
              1,
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          ),
        )
        .animate(animation);

    final opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(
            curve: const Interval(0.5, 0.8),
          ),
        )
        .animate(animation);

    return FadeTransition(
      opacity: opacityAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: SlideTransition(
          position: offsetAnimation,
          child: UCard(
            color: Colors.transparent,
            padding: EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
