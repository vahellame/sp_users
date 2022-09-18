import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

class QuizRoute extends VRouteElementBuilder {
  static const usersPreview = '/users_preview';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: usersPreview,
        // widget: const UsersPreviewScreen(),
        widget: Container(),
      ),
    ];
  }
}
