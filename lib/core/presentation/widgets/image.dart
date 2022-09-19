import 'package:cached_network_image/cached_network_image.dart';
import 'package:sp_users/core/presentation/presentation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UNetworkImage extends StatelessWidget {
  const UNetworkImage(
    this.imageUrl, {
    this.fit,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    // Site protected by CloudFlare
    return Transform.scale(
      scale: 1.1,
      child: WebView(
        backgroundColor: Colors.grey,
        initialUrl: imageUrl,
      ),
    );
    // return CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   fit: fit,
    //   placeholder: (context, url) => const UPreloader(),
    //   errorWidget: (context, url, error) => const Icon(
    //     Icons.error,
    //     color: Colors.white,
    //   ),
    // );
  }
}
