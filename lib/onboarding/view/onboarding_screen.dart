import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/my_routes.dart';
import '../../style/my_colors.dart';
import '../logic/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFF000C8C)),
                  child: Image.asset('assets/images/ic_cover.png', scale: 3),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.transparent,
                  MyColors.primaryColor,
                  MyColors.primaryColor,
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(flex: 50, child: const SizedBox()),
                Expanded(
                  flex: 50,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(MyRoutes.verifyTicket);
                        },
                        child: Text(
                          'Тоглолтын тасалбараар санал өгөх',
                          style: TextStyle(fontFamily: 'GIP'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(MyRoutes.selectLeague);
                        },
                        child: Text('Шууд санал өгөх'),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Та үргэлжлүүлснээр The League-ийн ',
                            style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Үйлчилгээний нөхцөл',
                              style: TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            ' болон ',
                            style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Нууцлалын бодлогыг',
                              style: TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            ' зөвшөөрч байна.',
                            style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset('assets/icons/ic_logo.png', width: 60, height: 60),
                      const SizedBox(height: 4),
                      Text(
                        '@TheLeague 2023',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
