import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/register_controller.dart';
import '../suit/components/register_progress.dart';
import 'register_page_additional.dart';
import 'register_page_body.dart';
import 'register_page_personal.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (RegisterController controller) => Scaffold(
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
            const SizedBox(height: 16),
            Expanded(
              child: PageView(
                onPageChanged: (index) => controller.state.selectedIndex.value = index,
                children: [
                  RegisterPagePersonal(),
                  RegisterPageBody(),
                  RegisterPageAdditional(),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
