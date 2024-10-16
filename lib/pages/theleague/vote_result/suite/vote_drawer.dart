import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../route/my_routes.dart';
import '../../../../style/my_colors.dart';

class VoteDrawer extends StatelessWidget {
  final String gender;
  final RxList<Map<String, dynamic>> histories;
  const VoteDrawer({required this.gender, required this.histories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          Text(
            'Архив',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'GIP',
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.white.withOpacity(0.05), height: 1, thickness: 1),
          const SizedBox(height: 24),
          Expanded(
            child: histories.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var index = 0; index < histories.length; index++)
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                '${MyRoutes.homeScreen}/$gender/true/online',
                                arguments: histories[index]['vote'],
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                color: MyColors.canvasColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${histories[index]['createdAt']}',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'GIP'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: MyColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Сонгох',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'GIP',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/ic_empty.png',
                          scale: 3,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Одоогоор санал алга байна',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: 'GIP',
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
