import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../competition_detail/suit/competition_detail_routes.dart';
import '../../competition_detail_parent/suit/competition_parent_routes.dart';

class HomePollItem extends StatelessWidget {
  final dynamic data;
  const HomePollItem({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            color: MyColors.grey200,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: '${data['logo_square']}?size=w400',
            imageBuilder: (context, imageProvider) => Container(
              height: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              height: 120,
              width: 90,
              child: Center(child: const CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor)),
            ),
            errorWidget: (context, url, error) => Container(
              height: 120,
              width: 90,
              child: Image.asset(
                'assets/images/ic_logo_bg.png',
                color: MyColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${data['name']}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                FaIcon.location_dot,
                style: FaIcon.regular().copyWith(color: MyColors.grey500, fontSize: 12),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${data['address']['name']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: MyColors.grey500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                FaIcon.calendar,
                style: FaIcon.light().copyWith(color: MyColors.grey500, fontSize: 12),
              ),
              const SizedBox(width: 4),
              Text(
                '${DateFormat('MM сарын dd').format(DateTime.parse('${data['startDate']}'))}',
                style: TextStyle(fontSize: 12, color: MyColors.grey500),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              if (data['hasChildren']) {
                if (data['eventType'] == 'poll') {
                  Get.toNamed(CompetitionDetailRoutes.competitionDetailScreen + '/${data['id']}');
                } else {
                  Get.toNamed(
                    CompetitionParentRoutes.competitionParentScreen + '/${data['code']}',
                    parameters: {
                      'name': '${data['name']}',
                      'image': '${data['logo_square']}',
                    },
                  );
                }
              } else {
                Get.toNamed(CompetitionDetailRoutes.competitionDetailScreen + '/${data['id']}');
              }
            },
            child: Text(
              'Санал өгөх',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
