import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/create_team/suit/create_team_routes.dart';
import '../pages/login/suit/login_routes.dart';
import '../pages/register/suit/register_routes.dart';
import '../style/my_colors.dart';
import 'fa_icon.dart';

class BasicUtils {
  final ImagePicker _picker = ImagePicker();

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

  void noTeamDialog({required String from}) {
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
              onPressed: () async {
                Get.toNamed(CreateTeamRoutes.createTeamScreen, parameters: {'from': from});
              },
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
                Get.toNamed(RegisterRoutes.registerEmailScreen);
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
