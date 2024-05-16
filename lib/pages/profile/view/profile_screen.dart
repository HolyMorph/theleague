import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) => Scaffold(
        body: Text('profile'),
      ),
    );
  }
}
