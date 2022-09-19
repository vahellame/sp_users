import 'package:sp_users/core/presentation/presentation.dart';

class UPaginateListener extends StatelessWidget {
  const UPaginateListener({
    Key? key,
    required this.onFetchRequest,
    this.requestScrollPosition = 500,
    required this.child,
  }) : super(key: key);

  final VoidCallback onFetchRequest;
  final double requestScrollPosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: scrollListener,
      child: child,
    );
  }

  bool scrollListener(ScrollNotification notification) {
    if (notification.metrics.extentAfter <= requestScrollPosition) {
      onFetchRequest();
    }

    return true;
  }
}
