import 'package:flutter/material.dart';

import '../../../style/my_colors.dart';
import '../suit/components/profile_info.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        title: Text('Хувийн мэдээлэл'),
      ),
      body: Column(
        children: [
          ProfileInfo(),
        ],
      ),
    );
  }
}
