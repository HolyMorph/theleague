import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../logic/register_controller.dart';
import '../suit/components/register_type_item.dart';
import '../suit/register_routes.dart';

class RegisterTypeScreen extends GetView<RegisterController> {
  const RegisterTypeScreen({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 36,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Бүртгэлийн төрөл',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RegisterTypeItem(
            title: 'Тамирчнаар бүртгүүлэх',
            imagePath: 'assets/images/register/ic_athelete.png',
            desc: 'Та тамирчнаар бүртгүүлснээр танд Sport Lab-ын ID үүсэх бөгөөд та тэмцээн уралдаанд энэхүү бүртгэлээрээ оролцох боломжтой юм.',
            onTap: () {
              controller.state.registerType.value = 'athlete';
              Get.toNamed(RegisterRoutes.registerEmailScreen);
            },
            buttonColor: MyColors.primaryColor,
          ),
          const SizedBox(height: 16),
          RegisterTypeItem(
            title: 'Хэрэглэгчээр бүртгүүлэх',
            imagePath: 'assets/images/register/ic_client.png',
            desc:
                'Та хэрэглэгчээр бүртгүүлснээр тухайн тэмцээний санал хураалтад оролцох боломжтой болох бөгөөд цаашид бүртгэлээ тамирчин болгох боломжтой.',
            onTap: () {
              controller.state.registerType.value = 'client';
              Get.toNamed(RegisterRoutes.registerEmailScreen);
            },
            buttonColor: Colors.black,
          ),
        ],
      ).paddingAll(16),
    );
  }
}
