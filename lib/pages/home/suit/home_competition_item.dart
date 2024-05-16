import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../competition_detail/suit/competition_detail_routes.dart';

class HomeCompetitionItem extends StatelessWidget {
  const HomeCompetitionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Get.toNamed(CompetitionDetailRoutes.competitionDetailScreen);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/ic_logo.png',
                  height: 90,
                  width: 90,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Children Day 3x3',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: MyColors.grey500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Хүүхдийн парк',
                        style: TextStyle(fontSize: 12, color: MyColors.grey500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 20,
                        color: MyColors.grey500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Бя, 6 сарын 1 - Ня, 6 сарын 2',
                        style: TextStyle(fontSize: 12, color: MyColors.grey500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
