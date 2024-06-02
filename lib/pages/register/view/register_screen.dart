import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/register_controller.dart';
import '../suit/components/register_progress.dart';
import 'register_page_additional.dart';
import 'register_page_body.dart';
import 'register_page_personal.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        automaticallyImplyLeading: false,
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 20),
          child: const SizedBox(),
        ),
      ),
      body: Column(
        children: [
          RegisterProgress(),
          Expanded(
            child: PageView(
              controller: controller.state.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => controller.state.selectedIndex.value = index,
              children: [
                RegisterPagePersonal(),
                RegisterPageBody(),
                const RegisterPageAdditional(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
