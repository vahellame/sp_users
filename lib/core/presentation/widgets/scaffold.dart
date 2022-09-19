import 'package:sp_users/core/presentation/presentation.dart';

class UScaffold extends StatelessWidget {
  const UScaffold({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.floatingActionButton,
    required this.body,
    this.heroTag,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final Widget body;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        leading: Visibility(
          visible: context.router.canPopSelfOrChildren,
          child: IconButton(
            icon: const Icon(FeatherIcons.arrowLeftCircle),
            onPressed: () => context.popRoute(),
          ),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: heroTag != null
              ? Hero(
                  tag: heroTag!,
                  flightShuttleBuilder: customFlightShuttleBuilder,
                  child: UCard(
                    color: backgroundColor,
                    padding: EdgeInsets.zero,
                    borderRadius: DesignConstants.borderRadiusOnlyTop,
                    child: body,
                  ),
                )
              : UCard(
                  color: backgroundColor,
                  padding: EdgeInsets.zero,
                  borderRadius: DesignConstants.borderRadiusOnlyTop,
                  child: body,
                ),
        ),
      ),
    );
  }

  // ignore: long-parameter-list
  Widget customFlightShuttleBuilder(
    _,
    animation,
    flightDirection,
    fromHeroContext,
    toHeroContext,
  ) {
    {
      final fromHero = fromHeroContext.widget as Hero;
      final toHero = toHeroContext.widget as Hero;

      return UCard(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(
                    curve: const Interval(
                      0.9,
                      1,
                    ),
                  ),
                ),
              ),
              // ignore: avoid-nested-conditional-expressions
              child: flightDirection == HeroFlightDirection.push ? toHero.child : fromHero.child,
            ),
            FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 1.0, end: 0.0).chain(
                  CurveTween(
                    curve: const Interval(
                      0,
                      0.1,
                    ),
                  ),
                ),
              ),
              // ignore: avoid-nested-conditional-expressions
              child: flightDirection != HeroFlightDirection.push ? toHero.child : fromHero.child,
            ),
          ],
        ),
      );
    }
  }
}
