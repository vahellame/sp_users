import 'package:sp_users/core/infrastructure/infrastructure.dart';
import 'package:sp_users/core/presentation/presentation.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  runApp(const ApplicationPlaceholder());
  final pathProviderData = await initPathProvider();
  WebView.platform = AndroidWebView();
  runApp(
    ProviderScope(
      overrides: [
        pathProvider.overrideWithValue(pathProviderData),
      ],
      child: Application(),
    ),
  );
}
