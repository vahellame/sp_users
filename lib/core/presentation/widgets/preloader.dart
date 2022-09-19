import 'package:flutter/cupertino.dart';
import 'package:sp_users/core/presentation/presentation.dart';

class UPreloader extends StatelessWidget {
  const UPreloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}

class UWrappedPreloader extends StatelessWidget {
  const UWrappedPreloader({
    Key? key,
    required this.showPreloader,
    required this.child,
  }) : super(key: key);

  final bool showPreloader;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showPreloader)
          Positioned.fill(
            child: Container(
              color: Colors.white60,
              child: const UPreloader(),
            ),
          ),
      ],
    );
  }
}
