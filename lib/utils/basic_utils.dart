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

  static String formattedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return '0$time';

      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    return '${getParsedTime(min.toString())}:${getParsedTime(sec.toString())}';
  }
}
