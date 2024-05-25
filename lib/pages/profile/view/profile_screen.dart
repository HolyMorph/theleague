import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../settings/suit/settings_routes.dart';
import '../logic/profile_controller.dart';
import '../suit/components/personal_info.dart';
import '../suit/components/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) => Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          title: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Миний бүртгэл',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight - 20),
            child: const SizedBox(),
          ),
        ),
        body: Column(
          children: [
            PersonalInfo(),
            const SizedBox(height: 24),
            ProfileMenuItem(
                onTap: () {
                  Get.toNamed(SettingsRoutes.settingsScreen);
                },
                icon: FaIcon.user_edit,
                title: 'Хувийн мэдээлэл',),
            const SizedBox(height: 4),
            ProfileMenuItem(onTap: () {}, icon: FaIcon.trophy, title: 'Миний тэмцээнүүд'),
            const SizedBox(height: 4),
            ProfileMenuItem(onTap: () {}, icon: FaIcon.medal, title: 'Миний шагналууд'),
            const SizedBox(height: 16),
            ProfileMenuItem(onTap: () {}, icon: FaIcon.circleInfo, title: 'Үйлчилгээний нөхцөл'),
            const SizedBox(height: 4),
            ProfileMenuItem(onTap: () {}, icon: FaIcon.circleQuestion, title: 'Заавар'),
            const SizedBox(height: 4),
            ProfileMenuItem(onTap: () {}, icon: FaIcon.quit, title: 'Системээс гарах'),
          ],
        ),
      ),
    );
  }
}
