import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../style/my_colors.dart';
import '../../../core/logic/core_controller.dart';

class MandateBottomSheet extends StatelessWidget {
  final List<dynamic> mandates;
  final String orgLogo;
  final String date;
  final String gameName;
  final String? gameType;
  MandateBottomSheet({
    required this.mandates,
    required this.gameType,
    required this.gameName,
    required this.date,
    required this.orgLogo,
    super.key,
  });

  final CoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: Get.size.height * 0.85,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: mandates.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/ic_mandate.png', fit: BoxFit.cover),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/ic_logo_small.png',
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              '${DateFormat('y/MM/dd').format(DateTime.parse('${date}'))}',
                              style: TextStyle(
                                fontSize: 14,
                                color: MyColors.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: orgLogo,
                              imageBuilder: (context, imageProvider) => Container(
                                height: 50,
                                width: 50,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                  color: Colors.white,
                                ),
                              ),
                              placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/ic_logo_bg.png',
                                  color: MyColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          gameName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${DateFormat('y/MM/dd').format(DateTime.parse('${date}'))}',
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColors.darkGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: controller.state.meData['avatar'],
                              imageBuilder: (context, imageProvider) => Container(
                                height: Get.size.width * 0.4,
                                width: Get.size.width * 0.28,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                height: Get.size.width * 0.4,
                                width: Get.size.width * 0.28,
                                child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: Get.size.width * 0.4,
                                width: Get.size.width * 0.28,
                                child: Image.asset(
                                  'assets/images/ic_logo_small.png',
                                  color: MyColors.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.state.meData['firstName'],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  controller.state.meData['lastName'],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  mandates[index]['teamName'] ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Тамирчин',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      gameType ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                                    ),
                                    Text(
                                      '#${controller.state.meData['code']}',
                                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.size.width * 0.3,
                                width: Get.size.width * 0.3,
                                child: QrImageView(
                                  data: mandates[index]['_id'],
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'SportsLab LLC, 2024 он',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              'Хаах',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
