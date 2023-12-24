import 'package:url_launcher/url_launcher.dart';

class BasicUtils {
  Future<void> urlLaunch(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
