import 'package:url_launcher/url_launcher.dart';

void launchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(url);
  } else {
    if (await canLaunchUrl(Uri.parse('https://$url'))) {
      launchUrl('https://$url');
    } else {
      throw 'Could not launch $url';
    }
  }
}
