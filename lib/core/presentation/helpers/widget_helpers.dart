import 'package:sp_users/core/presentation/presentation.dart';

extension UWidgetExtensions on Widget {
  Widget wrap(Widget Function(Widget child) builder, [bool condition = true]) {
    if (condition) {
      return builder(this);
    }

    return this;
  }
}

extension UWidgetSliverExtensions on Widget {
  Widget get sliverBox => SliverToBoxAdapter(child: this);

  SliverPadding sliverPadding(EdgeInsets padding) {
    return SliverPadding(padding: padding, sliver: this);
  }

  SliverPadding get sliverPaddingZero {
    return SliverPadding(padding: EdgeInsets.zero, sliver: this);
  }
}

extension UWidgetIterableSliverExtensions on List<Widget> {
  List<Widget> get sliverBox => map((e) => e.sliverBox).toList();

  List<Widget> sliverPadding(EdgeInsets padding) {
    return map((e) => e.sliverPadding(padding)).toList();
  }

  List<Widget> get sliverPaddingZero {
    return map((e) => e.sliverPaddingZero).toList();
  }
}
