import 'package:get/get.dart';

import '../logic/settings_binding.dart';
import '../view/profile_settings_screen.dart';
import 'settings_routes.dart';

class SettingsPages {
  static List<GetPage> pages = [
    GetPage(
      name: SettingsRoutes.settingsScreen,
      page: () => ProfileSettingScreen(),
      binding: SettingsBinding(),
    ),
  ];
}
