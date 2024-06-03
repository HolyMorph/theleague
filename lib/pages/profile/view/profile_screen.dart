import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/fa_icon.dart';
import '../../../utils/my_storage.dart';
import '../../core/logic/core_controller.dart';
import '../../core/suit/core_type.dart';
import '../../webview/my_web_view.dart';
import '../logic/profile_controller.dart';
import '../suit/components/personal_info.dart';
import '../suit/components/profile_menu_item.dart';
import '../suit/components/profile_not_athlete.dart';
import 'policy_screen.dart';
import 'profile_not_login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

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
        body: Obx(() {
          return !Get.find<CoreController>().state.isLoggedIn.value
              ? ProfileNotLoginScreen()
              : Column(
                  children: [
                    Get.find<CoreController>().state.meData['type'] == 'clientuser' ? ProfileNotAthlete() : PersonalInfo(),
                    const SizedBox(height: 16),
                    // ProfileMenuItem(
                    //   onTap: () {
                    //     Get.toNamed(SettingsRoutes.settingsScreen);
                    //   },
                    //   icon: FaIcon.user_edit,
                    //   title: 'Хувийн мэдээлэл',
                    // ),
                    // const SizedBox(height: 4),
                    // ProfileMenuItem(
                    //   onTap: () {},
                    //   icon: FaIcon.user_square,
                    //   title: 'Миний мандат',
                    // ),
                    // const SizedBox(height: 4),
                    // ProfileMenuItem(
                    //   onTap: () {
                    //     Get.toNamed(MyTeamsRoutes.myTeamsScreen);
                    //   },
                    //   icon: FaIcon.user_group,
                    //   title: 'Миний багууд',
                    // ),
                    //const SizedBox(height: 4),
                    ProfileMenuItem(
                      onTap: () {
                        Get.to(() => PolicyScreen());
                      },
                      icon: FaIcon.circleInfo,
                      title: 'Үйлчилгээний нөхцөл',
                    ),
                    const SizedBox(height: 4),
                    ProfileMenuItem(
                      onTap: () {
                        Get.to(
                          () => MyWebView(
                            title: 'Бүртгэл устгах',
                            url: Constants().DELETE_ACCOUNT_URL,
                          ),
                        );
                      },
                      icon: FaIcon.trash,
                      title: 'Бүртгэл устгах',
                    ),
                    const SizedBox(height: 4),
                    // ProfileMenuItem(onTap: () {}, icon: FaIcon.circleQuestion, title: 'Заавар'),
                    // const SizedBox(height: 4),
                    ProfileMenuItem(
                      onTap: () {
                        _showQuitDialog(context);
                      },
                      icon: FaIcon.quit,
                      title: 'Системээс гарах',
                    ),
                  ],
                );
        }),
      ),
    );
  }

  void _showQuitDialog(BuildContext context) {
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
                Text(FaIcon.quit, style: FaIcon.regular().copyWith(fontSize: 16)),
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
              ],
            ),
            Text(
              'Системээс гарах',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.neutral900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Та системээс гарахдаа итгэлтэй байна уу?',
              style: TextStyle(
                fontSize: 14,
                color: MyColors.grey600,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: MyColors.buttonRedColor),
              onPressed: () async {
                await MyStorage.instance.clearAllData();
                Get.back();
                Get.find<CoreController>().state.coreType.value = CoreType.splash;
              },
              child: Text('Гарах'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: MyColors.grey300),
                ),
              ),
              onPressed: () => Get.back(),
              child: Text(
                'Болих',
                style: TextStyle(color: MyColors.grey700, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
