import 'package:flutter/cupertino.dart';
import 'package:sp_users/core/presentation/presentation.dart';

class UDialog {
  static Future<T?> show<T>(BuildContext context, Widget child) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (_) {
        return SizedBox(
          width: double.infinity,
          child: Material(
            type: MaterialType.transparency,
            child: _UDialogWidgetBodyDecorator(
              body: child,
            ),
          ),
        );
      },
    );
  }
}

class _UDialogWidgetBodyDecorator extends StatelessWidget {
  const _UDialogWidgetBodyDecorator({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.viewPadding.top,
        bottom: context.viewInsets.bottom,
      ),
      child: UCard(
        borderRadius: DesignConstants.borderRadiusOnlyTop,
        padding: DesignConstants.padding.copyWith(
          bottom: DesignConstants.padding.bottom + context.viewPadding.bottom,
        ),
        child: body,
      ),
    );
  }
}
