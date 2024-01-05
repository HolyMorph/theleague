import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/my_routes.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/basic_utils.dart';
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.4, 1),
                      tileMode: TileMode.mirror,
                      colors: [
                        Color(0xff4D5163).withOpacity(0.5),
                        Color(0xff27273900),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.mediaQuery.size.height * 0.05),
                    child: Image.asset(
                      'assets/images/ic_cover.png',
                      fit: BoxFit.contain,
                      width: Get.mediaQuery.size.width,
                    ),
                  ),
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
                  Colors.transparent,
                  MyColors.primaryColor,
                  MyColors.primaryColor,
                  MyColors.primaryColor,
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(flex: 1, child: const SizedBox()),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF272739)),
                        onPressed: () {
                          Get.toNamed(MyRoutes.verifyTicket);
                        },
                        child: Text(
                          'Тоглолтоос санал өгөх',
                          style: TextStyle(fontFamily: 'GIP', fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4D5163)),
                        onPressed: () {
                          Get.toNamed('${MyRoutes.selectLeague}/online');
                        },
                        child: Text(
                          'Онлайнаар санал өгөх',
                          style: TextStyle(fontFamily: 'GIP', fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 16),
                      LocalStorage.getData('coachData') != null
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(
                                  int.parse(
                                    '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed('${MyRoutes.selectLeague}/coach');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(height: 30, width: 30, imageUrl: '${LocalStorage.getData('coachData')['teamLogo']}?size=w50'),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Багийн санал өгөх',
                                    style: TextStyle(fontFamily: 'GIP', fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 16),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Та үргэлжлүүлснээр The League-ийн ',
                            style: TextStyle(
                              color: Color(0xFF8B8B8B),
                              fontSize: 12,
                              fontFamily: 'GIP',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              BasicUtils().urlLaunch('https://theleague.mn/the-league-conditions.html');
                            },
                            child: Text(
                              'Үйлчилгээний нөхцөл',
                              style: TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'GIP',
                              ),
                            ),
                          ),
                          Text(
                            ' болон ',
                            style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 12, fontFamily: 'GIP'),
                          ),
                          GestureDetector(
                            onTap: () {
                              BasicUtils().urlLaunch('https://theleague.mn/the-league-privacy-policy.html');
                            },
                            child: Text(
                              'Нууцлалын бодлогыг',
                              style: TextStyle(color: Color(0xFF9E9E9E), fontWeight: FontWeight.w700, fontSize: 12, fontFamily: 'GIP'),
                            ),
                          ),
                          Text(
                            ' зөвшөөрч байна.',
                            style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 12, fontFamily: 'GIP'),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset('assets/icons/ic_logo.png', width: 60, height: 60),
                      const SizedBox(height: 4),
                      Text(
                        '@TheLeague 2024',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.3),
                          fontFamily: 'GIP',
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: MediaQuery.of(context).viewPadding.top,
            child: Material(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent),
                  child: Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
