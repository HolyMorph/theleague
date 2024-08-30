import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../pages/login/suit/login_routes.dart';
import '../pages/register/suit/register_routes.dart';
import '../style/my_colors.dart';
import 'fa_icon.dart';

class BasicUtils {
  final ImagePicker _picker = ImagePicker();

  Widget description({required String text}) {
    String value = text;
    value = value.split(' ').first;
    List<String> word_l = text.split(' ');
    String word = word_l.sublist(1, word_l.length).join(' ').replaceAll('&#', '\n');

    return RichText(
      text: TextSpan(
        text: value.capitalizeFirst,
        style: TextStyle(
          color: MyColors.grey500,
          fontSize: 14,
          fontFamily: 'GIP',
        ),
        children: <InlineSpan>[
          TextSpan(
            text: ' ${word}',
            style: TextStyle(
              color: MyColors.grey500,
              fontSize: 14,
              fontFamily: 'GIP',
            ),
          ),
        ],
      ),
    );
  }

  ///Url -ыг нээх функц
  static Future<bool> openUrl({required String url, String? storeUrl, LaunchMode? launchMode}) async {
    try {
      if (GetPlatform.isAndroid) {
        String formattedUrl = Uri.encodeFull(url);

        await launchUrlString(formattedUrl, mode: launchMode ?? LaunchMode.externalApplication);
      } else {
        String encodedUrl = Uri.encodeFull(url);
        if (await canLaunchUrlString(encodedUrl)) {
          launchUrlString(encodedUrl, mode: launchMode ?? LaunchMode.externalApplication);
        } else {
          launchUrl(Uri.parse(storeUrl ?? ''));
        }
      }

      return true;
    } catch (e) {
      launchUrl(Uri.parse(storeUrl ?? ''));
    }

    return false;
  }

  static String getStoreUrl(String paymentName) {
    bool isAndroid = GetPlatform.isAndroid;
    switch (paymentName) {
      case 'socialpay-deeplink':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=mn.egolomt.socialpay'
            : 'https://apps.apple.com/mn/app/socialpay/id1152919460';
      case 'candy':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.mobicom.candy' : 'https://apps.apple.com/mn/app/monpay/id978594162';
      case 'toki':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=com.toki.mn' : 'https://apps.apple.com/af/app/toki/id1504679492';
      case 'qPay wallet':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.qpay.wallet' : 'https://apps.apple.com/us/app/qpay-wallet/id1501873159';
      case 'Khan bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=mn.slide.khaanbank'
            : 'https://apps.apple.com/us/app/khan-bank/id1555908766';
      case 'State bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=mn.statebank.mobilebank'
            : 'https://apps.apple.com/us/app/state-bank/id703343972';
      case 'Xac bank':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=com.xacbank.mobile' : 'https://apps.apple.com/us/app/xacbank/id1534265552';
      case 'Trade and Development bank':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.tdb.pay' : 'https://apps.apple.com/us/app/tdb-online/id1458831706';
      case 'Most money':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=mn.grapecity.mostmoney'
            : 'https://apps.apple.com/us/app/mostmoney/id487144325';
      case 'National investment bank':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.nibank.mobilebank' : '';
      case 'Chinggis khaan bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=mn.ckbank.smartbank2'
            : 'https://apps.apple.com/vg/app/smartbank-ckbank/id1180620714';
      case 'Capitron bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=com.capitron'
            : 'https://apps.apple.com/mn/app/capitron-digital-bank/id1612591322';
      case 'Bogd bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=com.bogdbank.ebank.v2'
            : 'https://apps.apple.com/rs/app/bogd-mobile/id1475442374';
      case 'Trans bank':
        return isAndroid
            ? 'https://play.google.com/store/apps/details?id=com.transbank.transbankmobile'
            : 'https://apps.apple.com/us/app/transb%D0%B0nk/id1604334470';
      case 'M bank':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.mllc.mbank' : 'https://apps.apple.com/ao/app/%D0%BC-bank/id1455928972';
      case 'Ard App':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.ard.androidmm' : 'https://apps.apple.com/us/app/ard/id1369846744';
      case 'Arig bank':
        return isAndroid ? 'https://play.google.com/store/apps/details?id=mn.arig.online' : 'https://apps.apple.com/bw/app/arig-online/id6444022675';
    }

    return '';
  }

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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Цахим хаяг оруулна уу.';
    }

    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Буруу цахим хаяг оруулсан байна.';
    }
    return null;
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 8 && (phoneNumber.startsWith('9') || phoneNumber.startsWith('8'));
  }

  Future<XFile?> onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 100,
      );
      return (pickedFile);
    } catch (e) {
      debugPrint('${e}');
      return null;
    }
  }

  void noTeamDialog({required Function onTap}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: MyColors.grey200),
                  ),
                  child: Text(
                    FaIcon.user_medical,
                    style: FaIcon.regular().copyWith(fontSize: 16, color: MyColors.neutral900),
                  ),
                ),
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Бүртгэлтэй баг байхгүй байна',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.neutral900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Та баг үүсгэснээр дараа дараагийн тэмцээнд тухайн багаараа оролцох боломжтой.',
              style: TextStyle(
                fontSize: 14,
                color: MyColors.grey600,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FaIcon.user_medical,
                    style: FaIcon.regular().copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text('Баг үүсгэх'),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void qrDialog({required String title, required String qrData}) {
    Get.dialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            child: Container(
              width: Get.size.width - 32,
              height: Get.size.width - 32,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: MyColors.neutral900),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Center(child: QrImageView(data: qrData, size: Get.size.width - 120)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void notLoggedIn({required String route}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: MyColors.grey200),
                  ),
                  child: Text(
                    FaIcon.quit,
                    style: FaIcon.regular().copyWith(fontSize: 16, color: MyColors.neutral900),
                  ),
                ),
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Та нэвтэрч орно уу',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.neutral900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Та нэвтэрч орсноор тэмцээн уралдаан, арга хэмжээнд оролцох, бүртгүүлэх боломжтой.',
              style: TextStyle(
                fontSize: 14,
                color: MyColors.grey600,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                Get.toNamed(LoginRoutes.loginScreen, parameters: {'from': route});
              },
              child: Text('Нэвтрэх'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: MyColors.primaryColor),
                ),
              ),
              onPressed: () {
                Get.toNamed(RegisterRoutes.registerTypeScreen);
              },
              child: Text(
                'Бүртгүүлэх',
                style: TextStyle(color: MyColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
