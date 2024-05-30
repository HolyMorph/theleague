import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../login/suit/login_routes.dart';
import '../../register/suit/register_routes.dart';

class ProfileNotLoginScreen extends StatelessWidget {
  const ProfileNotLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_logo_bg.png',
            scale: 4,
            color: MyColors.primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            'Та нэвтэрч орно уу',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyColors.grey900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Та нэвтэрч орсноор тэмцээн уралдаанд оролцох, бүртгүүлэх боломжтой.',
            style: TextStyle(fontSize: 14, color: MyColors.grey600),
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(LoginRoutes.loginScreen);
            },
            child: Text(
              'Нэвтрэх',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
